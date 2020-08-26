module.exports = {
    plugins: [
        ['@vuepress/medium-zoom', {
            selector: '.portfolio-item-layout .content img'
        }],
        ['vuepress-plugin-container', {
            type: 'tip',
            before: info => `<div class="tip pt-4 pb-2"><p class="title">${info}</p>`,
            after: '</div>',
            defaultTitle: "TIP"
        }]
    ]
}