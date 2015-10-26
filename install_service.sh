# Test Initial connection

# Help section
usage="$(basename "$0") [-h] [-list] [-install service_name]-- 

where:
    -h		Show this help text
    -list 	List all availble Service-Deployer Services
    -install service_name	Installs github sample service on top of current stack
    -url service_READMEmd_url   Parses an Ambari Service README on github and attempts to install it to current stack"

while getopts ':h:list:l:install:url:' option; do
  case "$option" in
    :) printf "missing argument for -%s\n" "$OPTARG" >&2
       echo "$usage" >&2
       exit 1
       ;;
    h) echo "$usage"
       exit 1
       ;;

    l) echo "Available Packages:"
       cat conf/*.json | grep -E 'name' #todo-fix json parsing |'Description'
       exit 1
       ;;
    i) echo "Installing Package: $2"
       ./scripts/serviceHandler.sh $2 #todo-fix json parsing
       exit 1
       ;;
    u) echo "Downloading Package info from $2"
       ./scripts/gitHandler.sh $2 #todo-fix json parsing
       exit 1
       ;;

   \?) printf "illegal option: -%s\n" "$OPTARG" >&2
       echo "$usage" >&2
       exit 1
       ;;
  esac
done
shift $((OPTIND - 1))


