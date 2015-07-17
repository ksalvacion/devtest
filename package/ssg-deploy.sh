#!/bin/bash
CONF_FILE=config.properties

# Read config file and assign values
source $CONF_FILE

# Decrpyt pass
dest_pass=$(echo -n $enc_dest_pass | base64 --decode)

echo -e "\nSSG Command Line Migration Tool"
echo -e "Target gateway: $dest_hostname"
echo -e "Operation: Import"
echo -e "Component: $dest_folder\n";

# Detemplatize
./cmt/cmt2 detemplatize -o "../$dest_folder/objects" -d "../$dest_folder/dependencies" -r "../$dest_folder/referencesFile.xml" -t "../$dest_folder/remaining.properties"

# Import to target
#echo -e "Importing folder to $dest_folder...\n"
#./cmt/cmt2 migrateIn -i "../$dest_folder" -f "$dest_folder" -h $dest_hostname -u $dest_user -x $dest_pass -t "../$dest_folder/selected.properties" --auto=yes