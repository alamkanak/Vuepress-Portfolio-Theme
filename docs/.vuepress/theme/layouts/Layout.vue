<template>
    <div class="theme-container portfolio-item-layout">
        <div class="container py-5">
            <h1 class="display-4">{{ $page.title }}</h1>
            <p class="lead">{{ $page.frontmatter.description }}</p>
            <div>
                <b-badge variant="dark" v-for="tag in $page.frontmatter.tags" :key="tag" class="mr-2 font-weight-normal">{{ tag }}</b-badge>
            </div>
        </div>
        <div class="bg-light">
            <div class="container py-5">
                <div class="row">
                    <div class="col-9 content">
                        <Content />
                    </div>
                    <div class="col-3">
                        {{ $page.frontmatter.link }}
                        <b-button :href="link.url" target=”_blank” block variant="primary" class="mb-4" v-if="typeof $page.frontmatter.links !== 'undefined'" v-for="link in $page.frontmatter.links" :key="link.url">
                            <font-awesome-icon :icon="link.icon" class="mr-2" />
                            {{ link.text }}
                            <font-awesome-icon :icon="['fas', 'external-link-alt']" class="ml-2" />
                        </b-button>      
                        <div class="skills" v-if="typeof $page.frontmatter.skills !== 'undefined'" >
                            <h5>Skills involved</h5>
                            <ul>
                                <li v-for="skill in $page.frontmatter.skills">{{ skill }}</li>
                            </ul>
                        </div>
                        <div class="skills" v-if="typeof $page.frontmatter.tech !== 'undefined'" >
                            <h5>Tech used</h5>
                            <ul>
                                <li v-for="tech in $page.frontmatter.tech">{{ tech }}</li>
                            </ul>
                        </div>               
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>