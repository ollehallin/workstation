function ansible-facts-cache-on --description 'Enables Ansible facts caching'
    set -Ux ANSIBLE_CACHE_PLUGIN jsonfile
    set -Ux ANSIBLE_CACHE_PLUGIN_CONNECTION $HOME/.cache/ansible-facts
    set -Ux ANSIBLE_CACHE_PLUGIN_TIMEOUT 900
    echo "Ansible facts caching in JSON format in $ANSIBLE_CACHE_PLUGIN_CONNECTION enabled"
end
