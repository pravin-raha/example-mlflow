#!/bin/bash


while getopts ":c:n:" opt; do
  case $opt in
    c) conf_arg="$OPTARG"
    ;;
    n) dag_name_arg="$OPTARG"
    ;;
    \?) echo "Invalid option -$OPTARG" >&2
    ;;
  esac
done

config="$(cat $conf_arg)"

airflow trigger_dag  -c "$config" "$dag_name_arg"