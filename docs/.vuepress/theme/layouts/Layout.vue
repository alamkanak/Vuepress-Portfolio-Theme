<template>
    <div class="theme-container portfolio-item-layout">
        <div class="container py-5">
            <b-breadcrumb :items="[{'text': 'Home', 'href': $site.base}, {'text': $page.title, active: true}]" class="justify-content-center"></b-breadcrumb>
            <div class="text-center mt-4">
                <b-badge variant="light" v-for="tag in $page.frontmatter.tags" :key="tag" class="mr-2 font-weight-normal">{{ tag }}</b-badge>
            </div>
            <h1 class="display-4 text-center">{{ $page.title }}</h1>
            <h5 class="text-muted mb-0 text-center">{{ $page.frontmatter.description }}</h5>
        </div>
        <div>
            <div class="container ">
                <div class="row">
                    <div class="col-12 col-md-9 content pb-4">
                        <Content />
                    </div>
                    <div class="col-12 col-md-3">
                        {{ $page.frontmatter.link }}
                        <b-button :href="link.url" target=”_blank” block variant="theme" class="mb-4" v-if="typeof $page.frontmatter.links !== 'undefined'" v-for="link in $page.frontmatter.links" :key="link.url">
                            <font-awesome-icon :icon="link.icon" class="mr-2" />
                            {{ link.text }}
                            <font-awesome-icon :icon="['fas', 'external-link-alt']" class="ml-2 d-none d-xl-inline-block" />
                        </b-button>    
                        <div class="skills mb-4 mt-4" v-if="typeof $page.frontmatter.info !== 'undefined'" v-for="info in $page.frontmatter.info">
                            <h5 class="skill-title">{{info.key}}</h5>
                            <p>{{ info.value }}</p>
                        </div>    
                        <div class="skills mb-4 mt-4" v-if="typeof $page.frontmatter.skills !== 'undefined'" >
                            <h5 class="skill-title">Skills involved</h5>
                            <ul>
                                <li v-for="skill in $page.frontmatter.skills">{{ skill }}</li>
                            </ul>
                        </div>
                        <div class="skills mb-4 mt-4" v-if="typeof $page.frontmatter.tech !== 'undefined'" >
                            <h5 class="skill-title">Tech used</h5>
                            <ul>
                                <li v-for="tech in $page.frontmatter.tech">{{ tech }}</li>
                            </ul>
                        </div>               
                    </div>
                </div>
            </div>
        </div>
        <div class="separator"></div>
    </div>
</template>