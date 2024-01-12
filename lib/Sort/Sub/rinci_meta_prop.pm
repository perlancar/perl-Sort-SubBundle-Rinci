package Sort::Sub::rinci_meta_prop;

use 5.010001;
use strict;
use warnings;

# AUTHORITY
# DATE
# DIST
# VERSION

sub meta {
    return {
        v => 1,
        summary => 'Sort Rinci metadata properties (and attributes)',
    };
}

sub gen_sorter {
    require Sort::BySpec;

    my ($is_reverse, $is_ci) = @_;

    Sort::BySpec::cmp_by_spec(
        spec => [
            # from defhash
            'v',

            # from defhash
            'defhash_v',

            'entity_v',

            # from defhash
            'default_lang',

            # from defhash
            'name',
            qr/\Aname\./,

            # from defhash
            'caption',
            qr/\Acaption\./,

            # from defhash
            'summary',
            qr/\Asummary\./,

            # from defhash
            'description',
            qr/\Adescription\./,

            # from defhash
            'tags',

            'links',

            'x',
            qr/\Ax\./ => sub { $_[0] cmp $_[1] },

            qr// => sub { $_[0] cmp $_[1] },
        ],
        reverse => $is_reverse,
    );
}

1;
# ABSTRACT:

=for Pod::Coverage ^(gen_sorter|meta)$

=cut
