#!/bin/ksh

typeset jq='jq .'; whence -q jq || jq=cat

function build_blacklist {

    (   print_header 'ISLE Blacklist' 'Disabled Internet resources for any process (and any user).'
        print_disabled
        print_footer
    )   | $jq > blacklist.lsrules
}

function build_whitelist {

    (   print_header 'ISLE Whitelist' 'Allowed HTTP(S) targets for any process (and any user).'
        print_allowed
        print_footer
    )   | $jq > whitelist.lsrules
}

function print_allowed {

    typeset fmt='{ "action" : "allow", "ports" : [ "80", "443" ], "process" : "any", "protocol" : "tcp", "remote-%s" : "%s" }'
    integer count=0; typeset all=( addresses domains hosts )

    # Determine the number of entries that we will process
    typeset file; for file in ${all[@]}; do

        # Make sure the definition file exists
        file=whitelist.$file; [[ -f $file ]] || continue;

        # Count number of definition lines in file
        count+=$(grep -v '^#' $file | grep -v '^$' | wc -l)

    done

    # Make sure we have something to process
    (( count > 0 )) || return

    printf '"rules": [\n'

    # Process all possible definition files
    for file in ${all[@]}; do

        # Make sure the definition file exists
        typeset path=whitelist.$file; [[ -f $path ]] || continue

        # Read the definition file, line by line
        typeset line; cat $path | while read line; do

            # Ignore empty lines and comments
            [[ -z $line || ${line:0:1} == '#' ]] && continue

            # Determine if we should append a JSON comma
            typeset comma=','; (( -- count > 0 )) || comma=

            # Output the JSON line
            printf "$fmt$comma\n" $file $line

        done

    done

    printf ']\n'

}

function print_disabled {

    typeset fmt='{ "action" : "allow", "ports" : [ "80", "443" ], "process" : "any", "protocol" : "tcp", "remote-%s" : "%s" }'
    typeset all=( addresses domains hosts )

    # Process all possible definition files
    for file in ${all[@]}; do

        # Make sure the definition file exists
        typeset path=blacklist.$file; [[ -f $path ]] || continue

        # Count number of definition lines in file
        count=$(grep -v '^#' $path | grep -v '^$' | wc -l)

        # Make sure we have something to process
        (( count > 0 )) || return

        printf '"denied-remote-%s": [' $file

        # Read the definition file, line by line
        typeset line; cat $path | while read line; do

            # Ignore empty lines and comments
            [[ -z $line || ${line:0:1} == '#' ]] && continue

            # Determine if we should append a JSON comma
            typeset comma=','; (( -- count > 0 )) || comma=

            # Output the JSON line
            printf '"%s"%s\n' "$line" "$comma"

        done

        printf '],\n'

    done

    # Print dummy field so we don't have to clear the last comma above
    printf '"owner": "me"\n'

}

function print_footer {

    printf '}\n'

}

function print_header {

    typeset name="$1" brief="$2"
    printf '{\n"name": "%s",\n"description": "%s",\n' "$name" "$brief"

}

#build_whitelist
build_blacklist

# vim: nospell spelllang=en
