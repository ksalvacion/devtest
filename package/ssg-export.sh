#!/bin/bash
CONF_FILE=config.properties

# Read config file and assign values
source $CONF_FILE

# Decrpyt pass
src_pass=$(echo -n $enc_src_pass | base64 --decode)

echo -e "\nSSG Command Line Migration Tool"
echo -e "Source gateway: $src_hostname"
echo -e "Operation: Export"
echo -e "Component: $src_folder\n";

# Test Connection
echo -e "Testing connection...\n"
#./cmt/cmt2 listObjects -i "test" -h $src_hostname -u $src_user -x $src_pass

# Export root folder
./cmt/cmt2 migrateOut -i "$src_folder" -o "../$dest_folder" -h $src_hostname -u $src_user -x $src_pass --auto=yes

# Export configuration from source
#echo -e "Exporting folder $src_folder...\n"
#./cmt/cmt2 migrateOut -i "$src_folder" -o "../$dest_folder" -h $src_hostname -u $src_user -x $src_pass --auto=yes --templatize=yes

