(setq org-publish-project-alist
      '(("blog"
         :base-directory "~/"
         :html-extension "html"
         :base-extension "org"
         :publishing-directory "~/public_html/"
         :publishing-function (org-html-publish-to-html)
         :html-preamble nil
         :html-postamble nil)))
