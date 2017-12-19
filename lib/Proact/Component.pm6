use Proact::ComponentPlugin;
unit class Proact::Component;

method new(*%props) {
    my $obj = self.bless: |%props;
    my @plugins = |component-plugins;
    $obj = $obj but $_ for @plugins;
    $obj
}

method render {!!!}
