;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     ruby
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     (auto-completion :variables
                      auto-completion-enable-help-tooltip t
                      auto-completion-enable-snippets-in-popup t)
     helm
     clojure
     finance
     emoji
     emacs-lisp
     git
     markdown
     csv
     html
     pandoc
     slack
     twitter
     mu4e
     (spell-checking :variables spell-checking-enable-by-default nil)
     restclient
     docker
     plantuml
     (org :variables
          org-enable-github-support t)
     python
     ranger
     latex
     shell
     themes-megapack
     syntax-checking
     windows-scripts
     (osx :variables osx-use-option-as-meta nil)
     yaml
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      hackernews
                                      org-caldav
                                      org-mime
                                      logview
                                      helm-org-rifle
                                      helm-mu
                                      ob-async
                                      md4rd
                                      )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update t
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; Example for 5 recent files and 7 projects: '((recents . 5) (projects . 7))
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((agenda . 3)
                                (todos . 5)
                                 (recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'org-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(
                         cyberpunk
                         alect-black-alt
                         ample-zen
                         spacemacs-dark
                         spacemacs-light
                         solarized-light
                         solarized-dark
                         leuven
                         zenburn
                         )
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 18
                               :weight normal
                               :width normal
                               :powerline-scale 1.2)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab t
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ t
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state t
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native t
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers '(:relative nil
                                         :disabled-for-modes org-mode
                                         :size-limit-kb 1000)
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server t
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  ;; Set font for Emoji
  ;; (dolist (ft (fontset-list))
  ;;   (set-fontset-font ft 'unicode (font-spec :name "mononoki"))
  ;;   ;; (set-fontset-font ft 'unicode (font-spec :name "Symbola monospacified for mononoki") nil 'append)
  ;;   )
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (setq projectile-indexing-method 'native
  create-lockfiles nil
  display-time-default-load-average nil
  powerline-default-separator nil)
  (server-start)
  (add-hook 'flyspell-mode-hook (lambda () (auto-dictionary-mode 1)))
  (require 'helm-bookmark)

  (defun load-if-exists (f)
    (if (file-exists-p (expand-file-name f))
        (load-file (expand-file-name f))))
  (load-if-exists "~/repos/beancount/editors/emacs/beancount.el")
  (load-if-exists "~/repos/org-protocol-capture-html/org-protocol-capture-html.el")

  (setq ranger-cleanup-eagerly t)
  (global-emojify-mode)
  (with-eval-after-load 'mu4e-alert
    ;; Enable Desktop notifications
    (mu4e-alert-set-default-style 'notifier))
  (mu4e-alert-enable-notifications)

  ;; make the `gnus-dired-mail-buffers' function also work on
  ;; message-mode derived modes, such as mu4e-compose-mode
  (require 'gnus-dired)
  (defun gnus-dired-mail-buffers ()
    "Return a list of active message buffers."
    (let (buffers)
      (save-current-buffer
        (dolist (buffer (buffer-list t))
     	    (set-buffer buffer)
     	    (when (and (derived-mode-p 'message-mode)
     		             (null message-sent-message-via))
     	      (push (buffer-name buffer) buffers))))
      (nreverse buffers)))

  (setq gnus-dired-mail-mode 'mu4e-user-agent)
  (add-hook 'dired-mode-hook 'turn-on-gnus-dired-mode)

  (with-eval-after-load 'org
    (require 'org-protocol)
    (org-babel-do-load-languages
     'org-babel-load-languages
     '(
       (shell . t)
       (python . t)
       (ledger . t)
       (lisp . t)
       (clojure . t)
       (sql . t)
       (restclient . t)
       (plantuml . t)
       (http . t)
       ))
    (spacemacs/set-leader-keys "so" 'helm-org-rifle)
    (setq org-startup-with-inline-images t
       org-bullets-bullet-list '("⊢" "↳" "⋱")
       org-babel-use-quick-and-dirty-noweb-expansion t
       org-plantuml-jar-path "/usr/local/Cellar/plantuml/1.2017.18/libexec/plantuml.jar"
       plantuml-jar-path org-plantuml-jar-path
       twittering-use-master-password t
       twittering-private-info-file "~/Dropbox/.twittering-mode.gpg"
       org-directory "~/Dropbox/org/"
       org-confirm-babel-evaluate nil
       org-src-fontify-natively t
       org-export-with-toc nil
       org-footnote-define-inline t
       org-export-with-archived-trees nil
       org-journal-dir org-directory
       org-agenda-files (list org-directory)
       org-refile-targets (quote ((nil :maxlevel . 9) ;; current file
                                  (org-agenda-files :maxlevel . 9))) ;; all agenda files
       org-refile-use-outline-path 'file
       org-outline-path-complete-in-steps nil
       org-default-notes-file (concat org-directory "notes.org")
       org-use-fast-todo-selection t
       org-agenda-skip-scheduled-if-done t
       org-agenda-skip-deadline-if-done t
       org-agenda-skip-scheduled-if-done t
       org-clock-out-remove-zero-time-clocks nil
       org-agenda-custom-commands
       '(("d" "Todos of the next 7 days"
          tags-todo "DEADLINE>=\"<today>\"&DEADLINE<=\"<+7d>\"|SCHEDULED>=\"<today>\"&SCHEDULED<=\"<+7d>\""
          ((org-agenda-sorting-strategy '(todo-state-down)))))
       org-clock-in-resume t)

    (spacemacs/set-leader-keys-for-major-mode 'org-mode "A" 'org-archive-to-archive-sibling)
    (run-at-time nil 300 'org-save-all-org-buffers)

    ;; org customization see also http://doc.norang.ca/org-mode.html#TodoKeywords
    (setq org-todo-keywords
          (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
                  (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE" "MEETING"))))

    (setq org-todo-keyword-faces
          (quote (("TODO" :foreground "red" :weight bold)
                  ("NEXT" :foreground "blue" :weight bold)
                  ("DONE" :foreground "forest green" :weight bold)
                  ("WAITING" :foreground "orange" :weight bold)
                  ("HOLD" :foreground "magenta" :weight bold)
                  ("CANCELLED" :foreground "forest green" :weight bold)
                  ("MEETING" :foreground "forest green" :weight bold)
                  ("PHONE" :foreground "forest green" :weight bold))))

    (setq org-todo-state-tags-triggers
          (quote (("CANCELLED" ("CANCELLED" . t))
                  ("WAITING" ("WAITING" . t))
                  ("HOLD" ("WAITING") ("HOLD" . t))
                  (done ("WAITING") ("HOLD"))
                  ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
                  ("NEXT" ("WAITING") ("CANCELLED") ("HOLD"))
                  ("DONE" ("WAITING") ("CANCELLED") ("HOLD")))))

    ;; Capture templates for: TODO tasks, Notes, appointments, phone calls, meetings, and org-protocol
    (setq org-capture-templates
          (quote (("t" "Todo" entry (file "refile.org")
                   "* TODO %?\n%a\n" :clock-in t :clock-resume t)
                  ("r" "Respond" entry (file "refile.org")
                   "* NEXT Respond to %:from on %:subject\nSCHEDULED: %t\n%a\n" :clock-in t :clock-resume t :immediate-finish t)
                  ("n" "Note" entry (file "refile.org")
                   "* %? :NOTE:\n%a\n" :clock-in t :clock-resume t)
                  ("b" "Bug" entry (id "139C9E49-8B31-45D4-B35D-FD2969B0141F")
                   "* %? \n" :clock-in t :clock-resume t)
                  ("w" "org-protocol" entry (file "refile.org")
                   "* TODO Review %c\n" :immediate-finish t)
                  ("m" "Meeting" entry (file "refile.org")
                   "* MEETING with %? :MEETING:\n%U" :clock-in t :clock-resume t)
                  ("h" "Habit" entry (file "refile.org")
                   "* NEXT %?\n%a\nSCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a .+1d/3d>>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n"))))
    )
  (define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
  (define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(epg-gpg-program "gpg2")
 '(package-selected-packages
   (quote
    (tree-mode hierarchy datetime extmap sesman md4rd ob-async emoji-cheat-sheet-plus company-emoji rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake minitest chruby bundler inf-ruby logview tox white-sand-theme rebecca-theme exotica-theme sql-indent magithub ghub+ apiwrap magit-gh-pulls github-search github-clone github-browse-file gist gh marshal logito pcache ghub let-alist ledger-mode flycheck-ledger org-mime auctex-latexmk plantuml-mode helm-w3m w3m dash-functional kubernetes-evil kubernetes helm-gtags ggtags helm-dash dash-at-point clojure-snippets clj-refactor inflections edn multiple-cursors paredit peg cider-eval-sexp-fu cider seq queue clojure-mode org-category-capture org-caldav elfeed-org zonokai-theme zenburn-theme zen-and-art-theme yapfify yaml-mode xterm-color ws-butler winum which-key web-mode volatile-highlights vi-tilde-fringe vagrant-tramp vagrant uuidgen use-package underwater-theme ujelly-theme twittering-mode twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme toc-org tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit sunny-day-theme sublime-themes subatomic256-theme subatomic-theme spaceline spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle slim-mode slack emojify circe oauth2 websocket shell-pop seti-theme scss-mode sass-mode reverse-theme reveal-in-osx-finder restclient-helm restart-emacs ranger rainbow-delimiters railscasts-theme pyvenv pytest pyenv-mode py-isort purple-haze-theme pug-mode professional-theme powershell planet-theme pip-requirements phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pcre2el pbcopy pastels-on-dark-theme paradox spinner pandoc-mode ox-pandoc ox-gfm osx-trash osx-dictionary orgit organic-green-theme org-projectile org-present org-pomodoro org-journal org-download org-bullets open-junk-file omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme ob-restclient ob-http noctilux-theme niflheim-theme neotree naquadah-theme mustang-theme multi-term mu4e-maildirs-extension mu4e-alert ht move-text monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minimal-theme material-theme markdown-toc markdown-mode majapahit-theme magit-gitflow madhat2r-theme macrostep lush-theme lorem-ipsum live-py-mode linum-relative link-hint light-soap-theme less-css-mode launchctl jbeans-theme jazz-theme ir-black-theme inkpot-theme info+ indent-guide hydra hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt heroku-theme hemisu-theme help-fns+ helm-themes helm-swoop helm-pydoc helm-projectile helm-org-rifle helm-mu helm-mode-manager helm-make projectile helm-gitignore request helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag hc-zenburn-theme haml-mode hackernews gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md gandalf-theme fuzzy flyspell-correct-helm flyspell-correct flycheck-pos-tip flycheck pkg-info epl flx-ido flx flatui-theme flatland-theme firebelly-theme fill-column-indicator farmhouse-theme fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit magit git-commit with-editor evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight espresso-theme eshell-z eshell-prompt-extras esh-help emmet-mode elisp-slime-nav elfeed-web simple-httpd org-plus-contrib elfeed-goodies ace-jump-mode noflet powerline popwin elfeed dumb-jump dracula-theme dockerfile-mode docker json-mode tablist magit-popup docker-tramp json-snatcher json-reformat django-theme diminish demo-it darktooth-theme autothemer darkokai-theme darkmine-theme darkburn-theme dakrone-theme cython-mode csv-mode company-web web-completion-data company-statistics company-restclient restclient know-your-http-well company-quickhelp pos-tip company-auctex company-anaconda company column-enforce-mode color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme clean-aindent-mode cherry-blossom-theme busybee-theme bubbleberry-theme birds-of-paradise-plus-theme bind-map bind-key badwolf-theme auto-yasnippet yasnippet auto-highlight-symbol auto-dictionary auto-compile packed auctex apropospriate-theme anti-zenburn-theme anaconda-mode pythonic f dash s ample-zen-theme ample-theme alert log4e gntp alect-themes aggressive-indent afternoon-theme adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core async ac-ispell auto-complete popup cyberpunk-theme)))
 '(paradox-github-token t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
