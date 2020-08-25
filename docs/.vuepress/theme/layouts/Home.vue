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
                        <b-form-group label="" class="text-center">
                            <b-form-radio-group id="btn-radios-1" button-variant="outline-dark" v-model="selected" :options="tags" buttons name="radios-btn-default"></b-form-radio-group>
                        </b-form-group>
                    </b-col>
                </b-row>
            </b-container>
        </div>
    </div>
</template>


<script>
export default {
    data: function () {
        return {
            selected: "r1"
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
        tags() {
            var tags = this.$site.pages.filter(page => {
                return page.path.indexOf('/project/') >= 0;
            })
            .map(item => {
                return item.frontmatter.tags
            })
            .reduce(function(pre,cur) {
                return pre.concat(cur);
            });
            tags = _.uniq(tags).map(item => {
                return {text: item, value: _.snakeCase(item)};
            });
            tags.unshift({text: 'All', value: 'all'});
            this.selected = tags[0]['value'];
            return tags;
        }
    },
};
</script>