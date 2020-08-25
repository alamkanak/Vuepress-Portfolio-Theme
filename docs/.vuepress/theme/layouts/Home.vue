<template>
    <div class="theme-container home-layout">
        <b-container>
            <b-row>
                <b-col class="text-center my-5">
                    <img :src="$page.frontmatter.avatar" alt="avatar" class="avatar mb-5">
                    <h2 class="mb-4 display-4"><span class="text-muted">Hi! I'm</span> {{ $page.frontmatter.title}}</h2>
                    <div class="lead">
                        <Content />
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
                            <a class="project position-relative" v-if="shouldShowProject(project)" :href="project.path" v-for="project in projects" :key="project.path">
                                <img :src="project.frontmatter.thumbnail" alt="">
                                <p class="lead px-3 pt-3 mb-0 font-weight-normal"><v-clamp autoresize :max-lines="1">{{project.title}}</v-clamp></p>
                                <p class="px-3 text-muted"><v-clamp autoresize :max-lines="2">Manage and track TV shows Manage and track TV shows Manage and track TV shows</v-clamp></p>
                                <div class="position-absolute overlay"></div>
                            </a>
                        </transition-group>

                    </b-col>
                </b-row>
            </b-container>
        </div>
    </div>
</template>


<script>
import _ from 'lodash';
import VClamp from 'vue-clamp';
export default {
    components: {VClamp},
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
        }
    },
    methods: {
        shouldShowProject(project) {
            if (this.selectedTag == "*") {
                return true;
            }
            var tags = project.frontmatter.tags;
            if (tags.length > 0) {
                return tags.map((el) => {
                        return _.snakeCase(el);
                    })
                    .includes(this.selectedTag);
            }
            return false;
        }
    }
};
</script>