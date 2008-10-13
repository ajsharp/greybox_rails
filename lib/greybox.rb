module Greybox
  module Helpers
    def greybox_page_link(name, options = {}, html_options = nil)
      link_to(name, options, :rel => 'gb_page_center[500, 500]')
    end
    
    def greybox_all
      [greybox_include_tag, greybox_helpers].join("\n")
    end
    
    # Params
    # ======
    # <tt>:gb_root</tt> - According to the Greybox documentation, this needs to be an absolute path (i.e. '/javascripts/greybox' AND NOT 'javascript/greybox')
    def greybox_include_tag(opts = {})
      opts[:gb_root] ||= "/javascripts/greybox/"
      javascript_tag { "var GB_ROOT_DIR = \"#{opts[:gb_root]}\";" }
    end
    
    # Params
    # ======
    # <tt>:ajs</tt>
    # <tt>:ajx_fx</tt>
    # <tt>:gb_scripts</tt>
    # <tt>:gb_styles</tt>
    def greybox_helpers(opts = {})
      opts[:ajs]        ||= "greybox/AJS.js"
      opts[:ajs_fx]     ||= "greybox/AJS_fx.js"
      opts[:gb_scripts] ||= "greybox/gb_scripts.js"
      opts[:gb_styles]  ||= "/javascripts/greybox/gb_styles.css"
      
      ([opts[:ajs], opts[:ajs_fx], opts[:gb_scripts]].collect { |path| javascript_include_tag(path) } + 
      [ stylesheet_link_tag(opts[:gb_styles]) ]
      ).join("\n")
    end
  end
end
