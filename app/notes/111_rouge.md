# Ruby on Rails #72 gem Rouge for code highlighting in Markdown

- https://www.youtube.com/watch?v=CqlVuoYIgEg
- https://github.com/rouge-ruby/rouge
- https://github.com/corsego/72-gem-rouge/commit/6c2b27eaf3cc951b32ae6099602544c724446a9a
- bundle add rouge
- update posts_helper

```

  require "redcarpet"
  require "rouge"
  require "rouge/plugins/redcarpet"
  
  class RougeHTML < Redcarpet::Render::HTML
    include Rouge::Plugins::Redcarpet
  end
  
  def markdown(text)
    extensions = %i[
        hard_wrap autolink no_intra_emphasis tables fenced_code_blocks
        disable_indented_code_blocks strikethrough lax_spacing space_after_headers
        quote footnotes highlight underline
      ]
    # Markdown.new(text, *extensions).to_html
    Markdown.new(text, *extensions).to_html.html_safe
  end
  
  def advanced_markdown(text)
    render_options = { 
      no_links: false,
      hard_wrap: true,
      link_attributes: { target: '_blank'}
    }
    extensions = {
      disable_indented_code_blocks: true,
      hard_wrap: true,
      autolink: true,
      no_intra_emphasis: true,
      tables: true,
      fenced_code_blocks: true,
      strikethrough: true,
      lax_spacing: true,
      space_after_headers: true,
      quote: true,
      footnotes: true,
      highlight: true,
      underline: true
    }
    # renderer = Redcarpet::Render::HTML.new(render_options)
    renderer = RougeHTML.new(render_options)
    Redcarpet::Markdown.new(renderer, extensions).render(text).html_safe
  end
```

- USING GITHUB css
- create the file: app/assets/stylesheets/github.css

```
.highlight table td { padding: 5px; }
.highlight table pre { margin: 0; }
.highlight .cm {
  color: #999988;
  font-style: italic;
}
.highlight .cp {
  color: #999999;
  font-weight: bold;
}
.highlight .c1 {
  color: #999988;
  font-style: italic;
}
.highlight .cs {
  color: #999999;
  font-weight: bold;
  font-style: italic;
}
.highlight .c, .highlight .ch, .highlight .cd, .highlight .cpf {
  color: #999988;
  font-style: italic;
}
.highlight .err {
  color: #a61717;
  background-color: #e3d2d2;
}
.highlight .gd {
  color: #000000;
  background-color: #ffdddd;
}
.highlight .ge {
  color: #000000;
  font-style: italic;
}
.highlight .gr {
  color: #aa0000;
}
.highlight .gh {
  color: #999999;
}
.highlight .gi {
  color: #000000;
  background-color: #ddffdd;
}
.highlight .go {
  color: #888888;
}
.highlight .gp {
  color: #555555;
}
.highlight .gs {
  font-weight: bold;
}
.highlight .gu {
  color: #aaaaaa;
}
.highlight .gt {
  color: #aa0000;
}
.highlight .kc {
  color: #000000;
  font-weight: bold;
}
.highlight .kd {
  color: #000000;
  font-weight: bold;
}
.highlight .kn {
  color: #000000;
  font-weight: bold;
}
.highlight .kp {
  color: #000000;
  font-weight: bold;
}
.highlight .kr {
  color: #000000;
  font-weight: bold;
}
.highlight .kt {
  color: #445588;
  font-weight: bold;
}
.highlight .k, .highlight .kv {
  color: #000000;
  font-weight: bold;
}
.highlight .mf {
  color: #009999;
}
.highlight .mh {
  color: #009999;
}
.highlight .il {
  color: #009999;
}
.highlight .mi {
  color: #009999;
}
.highlight .mo {
  color: #009999;
}
.highlight .m, .highlight .mb, .highlight .mx {
  color: #009999;
}
.highlight .sa {
  color: #000000;
  font-weight: bold;
}
.highlight .sb {
  color: #d14;
}
.highlight .sc {
  color: #d14;
}
.highlight .sd {
  color: #d14;
}
.highlight .s2 {
  color: #d14;
}
.highlight .se {
  color: #d14;
}
.highlight .sh {
  color: #d14;
}
.highlight .si {
  color: #d14;
}
.highlight .sx {
  color: #d14;
}
.highlight .sr {
  color: #009926;
}
.highlight .s1 {
  color: #d14;
}
.highlight .ss {
  color: #990073;
}
.highlight .s, .highlight .dl {
  color: #d14;
}
.highlight .na {
  color: #008080;
}
.highlight .bp {
  color: #999999;
}
.highlight .nb {
  color: #0086B3;
}
.highlight .nc {
  color: #445588;
  font-weight: bold;
}
.highlight .no {
  color: #008080;
}
.highlight .nd {
  color: #3c5d5d;
  font-weight: bold;
}
.highlight .ni {
  color: #800080;
}
.highlight .ne {
  color: #990000;
  font-weight: bold;
}
.highlight .nf, .highlight .fm {
  color: #990000;
  font-weight: bold;
}
.highlight .nl {
  color: #990000;
  font-weight: bold;
}
.highlight .nn {
  color: #555555;
}
.highlight .nt {
  color: #000080;
}
.highlight .vc {
  color: #008080;
}
.highlight .vg {
  color: #008080;
}
.highlight .vi {
  color: #008080;
}
.highlight .nv, .highlight .vm {
  color: #008080;
}
.highlight .ow {
  color: #000000;
  font-weight: bold;
}
.highlight .o {
  color: #000000;
  font-weight: bold;
}
.highlight .w {
  color: #bbbbbb;
}
.highlight {
  background-color: #f8f8f8;
}
```

- refresh the markdown, we should see github coloring
- to use rouge
- create: app/assets/stylesheets/rouge.css.erb

```
<%#= Rouge::Themes::ThankfulEyes.render %>
<%= Rouge::Themes::Base16.mode(:dark).render %>
```

- delete github.css if not going to be used, app.css imports everything
- refresh IT WORKED