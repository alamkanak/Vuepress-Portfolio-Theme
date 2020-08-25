<template>
    <div id="global-layout">    
        <component :is="layout" />    
        <!-- <b-alert show>Default Alert</b-alert>
        <header>
            <h1>Header</h1>
        </header> -->
        <footer class="text-center my-5">
            Made with ❤️ by Raquib-ul Alam
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