
#!/bin/bash
filename=$1
if [ ! -f "$filename" ]; then
    echo "File $filename not found."
    exit 1
fi
echo -n "Enter the replacement word for 'Product_name': "
read -r product
echo -n "Enter the replacement word for 'Endpoint_name' with 1st alphabet capital: "
read -r endpoint
echo -n "Enter the replacement word for 'Request_uri': "
read -r request_uri
echo -n "Enter the replacement word for 'Index-pattern': "
read -r index
mapfile -t client_urls < domain_file
for ((i=1; i<${#client_urls[@]}; i++)); do
    if grep -q "DOMAIN$i\b" "$filename"; then
        sed -i "s/DOMAIN$i\b/${client_urls[i]}/g" "$filename"
    else
        echo "Error: 'DOMAIN$i' not found in $filename."
    fi
done
sed -i "s/PRODUCT/$product/g" "$filename"
sed -i "s/ENDPOINT/$endpoint/g" "$filename"
sed -i "s/REQ_URI/$request_uri/g" "$filename"
sed -i "s/INDEX/$index/g" "$filename"
echo "Replacements complete in $filename."

