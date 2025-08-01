#!/usr/bin/env gawk -f

{
  if ( !($1%4) && (($1%100) || !($1%400)) ) print "true"
  else print "false"
}
