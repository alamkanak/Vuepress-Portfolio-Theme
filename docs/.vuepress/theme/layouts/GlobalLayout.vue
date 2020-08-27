<template>
    <div id="global-layout">    
        <component :is="layout" />    
        <!-- <b-alert show>Default Alert</b-alert>
        <header>
            <h1>Header</h1>
        </header> -->
        <footer class="text-center my-5 container">
            <ul v-if="typeof $site.themeConfig.social !== 'undefined'" class="mb-4 social">
                <li v-for="link in $site.themeConfig.social" :key="link.url" class="mx-3">
                    <a :href="link.url" target="_blank">
                        <font-awesome-icon :icon="link.icon" size="3x" />
                    </a>
                </li>
            </ul>
            <p>This website was made on ViewPress with ❤️ by Raquib-ul Alam. Love the site? <a href="https://github.com/alamkanak/Viewpress-Portfolio-Theme" target="_blank">Fork it on Github.</a></p>
        </footer>
    </div>
</template>

<script>
export default {
    computed: {
        layout() {
            if (this.$page.path) {
                if (this.$frontmatter.layout) {
                    // You can also check whether layout exists first as the default global layout does.
                    return this.$frontmatter.layout;
                }
                return "Layout";
            }
            return "NotFound";
        },
    },
};
</script>