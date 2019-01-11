function ansible-facts-cache-off --description 'Disables Ansible facts caching'
    set -Ue ANSIBLE_CACHE_PLUGIN
    set -Ue ANSIBLE_CACHE_PLUGIN_CONNECTION
    set -Ue ANSIBLE_CACHE_PLUGIN_TIMEOUT
    echo "Ansible facts caching disabled"
end
