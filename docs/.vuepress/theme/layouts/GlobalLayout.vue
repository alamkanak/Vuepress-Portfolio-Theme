<template>
    <div id="global-layout">
        In globallayout.vue
        <header>
            <h1>Header</h1>
        </header>
        <component :is="layout" />
        <footer>
            <h1>Footer</h1>
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