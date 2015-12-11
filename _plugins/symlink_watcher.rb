# Copyright 2014 Google. All rights reserved.
# Available under an MIT license that can be found in the LICENSE file.

# The symlink_watcher plugin extends jekyll-watch to also listen for changes in
# any symlinked sub-directories.
#
# For example, my _drafts directory is a symlink to a directory elsewhere on my
# filesystem.  This plugin will cause jekyll to regenerate my site when any
# files in my drafts folder change.

require "find"
require "jekyll-watch"
require "listen"

module Jekyll
  module Watcher
   
    def build_listener_with_symlinks(site, options)
      src = options["source"]
      dirs = [src]
      post_dir = "#{src}/_posts"
      draft_dir = "#{src}/_drafts"
       
      dirs << post_dir if File.directory?(post_dir) and File.symlink?(post_dir)
      dirs << draft_dir if options["show_drafts"] and File.directory?(draft_dir) and File.symlink?(draft_dir)
 
      Listen.to(
        *dirs,
        :ignore => listen_ignore_paths(options),
        :force_polling => options['force_polling'],
        &(listen_handler(site))
      )
    end

    # TODO: this doesn't work with the latest version of jekyll-watch
    alias_method :build_listener_without_symlinks, :build_listener
    alias_method :build_listener, :build_listener_with_symlinks
  end
end