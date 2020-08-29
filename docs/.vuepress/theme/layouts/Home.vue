<template>
    <div class="theme-container home-layout">
        <b-container>
            <b-row>
                <b-col class="text-center my-5">
                    <img :src="$page.frontmatter.avatar" alt="avatar" class="avatar mb-5 mt-4 medium-zoom">
                    <h2 class="mb-4 display-4">Hi! I'm {{ $page.frontmatter.title}}</h2>
                    <div class="lead">
                        <Content />
                    </div>

                    <div v-if="typeof $site.themeConfig.social !== 'undefined'" class="mt-5">
                        <h4 class="mb-4">Contact Me</h4>
                        <ul class="mb-4 social">
                            <li v-for="link in $site.themeConfig.social" :key="link.url" class="mx-3">
                                <a :href="link.url" target="_blank">
                                    <font-awesome-icon :icon="link.icon" size="3x" />
                                </a>
                            </li>
                        </ul>
                    </div>
                </b-col>
            </b-row>
        </b-container>
        <div v-if="typeof $page.frontmatter.skills !== 'undefined'" class="pb-4 skills">
            <div class="separator mb-5"></div>
            <h1 class="text-center mb-4">Skills Summary</h1>
            <div class="container">
                <div class="row justify-content-center pt-2">
                    <div class="col-12 col-lg-4" v-for="skill in $page.frontmatter.skills" :key="skill.title">
                        <div class="rounded-lg bg-light pt-4 pb-2 mb-4">
                            <div class="px-4">
                                <h4 class="mt-1">{{ skill.title }}</h4>
                                <p class="text-muted mb-4">{{skill.experience}}</p>
                            </div>
                            <div class="separator mb-4"></div>
                            <ul class="px-4">
                                <li v-for="att in skill.skills" class="mb-4">
                                    <div class="title mb-1">{{ att[0] }}</div>
                                    <div class="text-muted">{{ att[1] }}</div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="bg-light">
            <b-container>
                <b-row>
                    <b-col class="my-5">
                        <h1 class="mb-4 text-center">Noteworthy Projects</h1>
                        <div class="text-center pt-3 mb-2">
                            <b-button-group label="" class="mb-4 flex-wrap">
                                <b-button variant="success" v-for="tag in tags" :key="tag.value" v-bind:class="{active: selectedTag == tag.value}" @click="selectedTag = tag.value" class="mb-3 btn-theme">{{ tag.text }}</b-button>
                            </b-button-group>
                        </div>

                        <transition-group class="projects" name="projects">
                            <a class="project" v-if="shouldShowProject(project)" :href="project.path" v-for="project in projects" :key="project.path">
                                <img :src="project.frontmatter.thumbnail" alt="">
                                <p class="lead px-3 pt-3 mb-1 font-weight-normal text-center">{{project.title}}</p>
                                <p class="px-3 text-muted mb-2 clamp-2 text-center desc">{{ project.frontmatter.description }}</p>
                                <div class="mx-3 mb-3 clamp-1 text-center">
                                    <b-badge variant="light bg-light font-weight-normal" class="mr-1" v-for="tag in project.frontmatter.tags" :key="tag">{{ tag }}</b-badge>
                                </div>
                            </a>
                        </transition-group>

                    </b-col>
                </b-row>
            </b-container>
        </div>
    </div>
</template>


<script>
import _ from "lodash";
export default {
    data: function () {
        return {
            selectedTag: "*",
        };
    },
    computed: {
        layout() {
            if (this.$page.path) {
                if (this.$frontmatter.layout) {
                    return this.$frontmatter.layout;
                }
                return "Layout";
            }
            return "NotFound";
        },
        projects() {
            return this.$site.pages.filter((page) => {
                return page.path.indexOf("/project/") >= 0;
            }).sort(function (a,b) {
                return (a.frontmatter.date < b.frontmatter.date) ? -1 : (a.frontmatter.date > b.frontmatter.date) ? 1 : 0;
            }).reverse();
        },
        tags() {
            var sortorder = this.$site.themeConfig.tag_order
            var tags = this.projects
                .map((item) => {
                    return item.frontmatter.tags;
                })
                .reduce(function (pre, cur) {
                    return pre.concat(cur);
                });
            tags = _.uniq(tags).map((item) => {
                return { text: item, value: _.snakeCase(item) };
            }).sort(function (a,b) {
                if (typeof sortorder !== 'undefined') {
                    return sortorder.indexOf(a.text) - sortorder.indexOf(b.text);
                }
                return (a.text < b.text) ? -1 : (a.text > b.text) ? 1 : 0;
            });
            tags.unshift({ text: "All", value: "*" });
            this.selectedTag = tags[1]["value"];
            return tags;
        },
    },
    methods: {
        shouldShowProject(project) {
            if (this.selectedTag == "*") {
                return true;
            }
            var tags = project.frontmatter.tags;
            if (tags.length > 0) {
                return tags
                    .map((el) => {
                        return _.snakeCase(el);
                    })
                    .includes(this.selectedTag);
            }
            return false;
        },
        arraymove(arr, fromIndex, toIndex) {
            var element = arr[fromIndex];
            arr.splice(fromIndex, 1);
            arr.splice(toIndex, 0, element);
        }
    },
};
</script>