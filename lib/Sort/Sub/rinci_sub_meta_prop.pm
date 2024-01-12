package Sort::Sub::rinci_sub_meta_prop;

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
        summary => 'Sort Rinci subroutine metadata properties (and attributes)',
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

            # from Rinci meta
            'entity_v',

            'is_func',
            'is_meth',
            'is_class_meth',

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

            'args',

            'args_rels',

            'args_as',

            'result',

            'result_naked',

            'examples',

            'features',

            'deps',

            # from defhash
            'tags',

            # from Rinci meta
            'links',

            # from Rinci meta
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
