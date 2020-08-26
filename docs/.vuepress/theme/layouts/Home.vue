<template>
    <div class="theme-container home-layout">
        <b-container>
            <b-row>
                <b-col class="text-center my-5">
                    <b-alert show class="mb-5">This site is currently under construction</b-alert>
                    <img :src="$page.frontmatter.avatar" alt="avatar" class="avatar mb-5">
                    <h2 class="mb-4 display-4"><span class="text-muted">Hi! I'm</span> {{ $page.frontmatter.title}}</h2>
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
        <div class="bg-light">
            <b-container>
                <b-row>
                    <b-col class="my-5">
                        <h1 class="mb-4 text-center">Projects</h1>
                        <b-form-group label="" class="text-center mb-5">
                            <b-form-radio-group id="btn-radios-1" button-variant="outline-dark" v-model="selectedTag" :options="tags" buttons name="radios-btn-default"></b-form-radio-group>
                        </b-form-group>

                        <transition-group class="projects" name="projects">
                            <a class="project" v-if="shouldShowProject(project)" :href="project.path" v-for="project in projects" :key="project.path">
                                <img :src="project.frontmatter.thumbnail" alt="">
                                <p class="lead px-3 pt-3 mb-1 font-weight-normal">{{project.title}}</p>
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
            });
        },
        tags() {
            var tags = this.projects
                .map((item) => {
                    return item.frontmatter.tags;
                })
                .reduce(function (pre, cur) {
                    return pre.concat(cur);
                });
            tags = _.uniq(tags).map((item) => {
                return { text: item, value: _.snakeCase(item) };
            });
            tags.unshift({ text: "All", value: "*" });
            this.selected = tags[0]["value"];
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
    },
};
</script>