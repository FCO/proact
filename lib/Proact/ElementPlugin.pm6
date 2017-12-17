role Proact::ElementPlugin {}

proto element-plugins(|) is export {*}
multi element-plugins(+@plugins) {
    @Proact::element-plugins.push: $_ for @plugins
}
multi element-plugins() {
    @Proact::element-plugins.grep: Proact::ElementPlugin;
}
