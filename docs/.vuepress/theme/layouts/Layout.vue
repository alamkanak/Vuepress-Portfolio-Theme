<template>
    <div class="theme-container portfolio-item-layout">
        <div class="container py-5">
            <h1 class="display-4">{{ $page.title }}</h1>
            <p class="lead">{{ $page.frontmatter.description }}</p>
            <div>
                <b-badge variant="secondary" v-for="tag in $page.frontmatter.tags" :key="tag" class="mr-2">{{ tag }}</b-badge>
            </div>
        </div>
        <div class="bg-light">
            <div class="container py-5">
                <div class="row">
                    <div class="col-8">
                        <Content />
                    </div>
                    <div class="col-4">
                        <font-awesome-icon icon="user-secret" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>