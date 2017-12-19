role Proact::ElementPlugin {}

proto element-plugins(|) is export {*}
multi element-plugins(+@plugins) {
    @Proact::element-plugins.append: @plugins.grep: Proact::ElementPlugin
}
multi element-plugins() {
    @Proact::element-plugins.grep: Proact::ElementPlugin
}
