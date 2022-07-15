url=$1;

host=$(echo "$url" | sed -e 's|^[^/]*//||' -e 's|/.*$||');


GoLinkFinder -d $host | grep -v -e 'multipart\/\|UTC\|Pacific\|Australia\|Asia\|MM\|DD\|YY\|application\/\|Africa\|America\|GMT\|Europe\|text\/css\|image\/jpeg\|favicon\.ico\|^\.\|w3\.org\|^$\|\.png\|\.jpg\|googletagmanager\|google-analytics\|facebook\|instagram\|google\.com\|apple\.com\|\.css\|appgallery\|gtm\|woff\|image\/png\|text\/javascript\|\.svg\|speedcurve' >> jsout_$host;


cat jsout_$host | grep -v '\.js';


cat jsout_$host | grep 'http.*\.js' | grep -v '\.json' >> jsurls_$host;


cat jsurls_$host >> jsurls;
 

cat jsurls_$host | xargs -I@ zsh -c "echo -e '\n[URL]: @\n'; GoLinkFinder -d @ | grep -v -e 'multipart\/\|UTC\|Pacific\|Australia\|Asia\|MM\|DD\|YY\|application\/\|Africa\|America\|GMT\|Europe\|text\/css\|image\/jpeg\|favicon\.ico\|^\.\|w3\.org\|^$\|\.png\|\.jpg\|googletagmanager\|google-analytics\|facebook\|instagram\|google\.com\|apple\.com\|\.css\|appgallery\|gtm\|woff\|image\/png\|text\/javascript\|\.svg\|speedcurve'"


rm jsurls_$host; rm jsout_$host;
