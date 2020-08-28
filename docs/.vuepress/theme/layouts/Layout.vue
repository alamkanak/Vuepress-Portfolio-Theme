<template>
    <div class="theme-container portfolio-item-layout">
        <div class="container py-5">
            <b-breadcrumb :items="[{'text': 'Home', 'href': $site.base}, {'text': $page.title, active: true}]" class="justify-content-center mb-4"></b-breadcrumb>
            <h1 class="display-4 text-center pt-2">{{ $page.title }}</h1>
            <h5 class="text-muted mb-0 text-center">{{ $page.frontmatter.description }}</h5>
            <div class="text-center mt-2">
                <b-badge variant="light" v-for="tag in $page.frontmatter.tags" :key="tag" class="mr-2 font-weight-normal">{{ tag }}</b-badge>
            </div>
        </div>
        <div>
            <div class="container ">
                <div class="row">
                    <div class="col-12 col-md-9 content pb-4">
                        <Content />
                    </div>
                    <div class="col-12 col-md-3">
                        {{ $page.frontmatter.link }}
                        <div class="mb-4">
                            <b-button :href="link.url" target=”_blank” block variant="theme" class="mb-2" v-if="typeof $page.frontmatter.links !== 'undefined'" v-for="link in $page.frontmatter.links" :key="link.url">
                                <font-awesome-icon :icon="link.icon" class="mr-2" />
                                {{ link.text }}
                            </b-button>  
                        </div>  
                        <div class="skills mb-4 mt-4" v-if="typeof $page.frontmatter.info !== 'undefined'" v-for="info in $page.frontmatter.info">
                            <h5 class="skill-title">{{info.key}}</h5>
                            <p v-if="typeof info.value == 'string'">{{ info.value }}</p>
                            <ul v-if="typeof info.value == 'object'">
                                <li v-for="skill in info.value">{{ skill }}</li>
                            </ul>
                        </div>             
                    </div>
                </div>
            </div>
        </div>
        <div class="separator"></div>
    </div>
</template>