# Environment
function defineEnv() {
  
  export AUTHOR_DEFAULT="rydnr";
  export AUTHOR_DESCRIPTION="The author of the image(s) to build";
  if    [ "${AUTHOR+1}" != "1" ] \
     || [ "x${AUTHOR}" == "x" ]; then
    export AUTHOR="${AUTHOR_DEFAULT}";
  fi

  export AUTHOR_EMAIL="<rydnr@acm-sl.org>";
  export AUTHOR_EMAIL_DESCRIPTION="The author of the image(s) to build";
  if    [ "${AUTHOR_EMAIL+1}" != "1" ] \
     || [ "x${AUTHOR_EMAIL}" == "x" ]; then
    export AUTHOR_EMAIL="${AUTHOR_EMAIL_DEFAULT}";
  fi

  export NAMESPACE_DEFAULT="acmsl";
  export NAMESPACE_DESCRIPTION="The docker registry's namespace";
  if    [ "${NAMESPACE+1}" != "1" ] \
     || [ "x${NAMESPACE}" == "x" ]; then
    export NAMESPACE="${NAMESPACE_DEFAULT}";
  fi

  export DATE_DEFAULT="$(date '+%Y%m')";
  export DATE_DESCRIPTION="The date used to tag images";
  if    [ "${DATE+1}" != "1" ] \
     || [ "x${DATE}" == "x" ]; then
    export DATE="${DATE_DEFAULT}";
  fi

  ENV_VARIABLES=(\
    AUTHOR \
    AUTHOR_EMAIL \
    NAMESPACE \
    DATE \
   );
 
  export ENV_VARIABLES;
}
