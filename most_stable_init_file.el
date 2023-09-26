(menu-bar-mode -1)  ; Disable the menu bar to provide a cleaner interface.
;; Disabling Menu Bar and Tool Bar:,
(tool-bar-mode -1)  ; Disable the tool bar for a more minimalistic look.

;; Maximizing Emacs on Startup:
(add-hook 'window-setup-hook 'toggle-frame-maximized t)  ; Maximize Emacs on startup for a distraction-free workspace.

;; Disabling the Splash Screen:
(setq inhibit-splash-screen t)  ; Prevent the splash screen from appearing on startup.

;; Hiding the Scroll Bar:
(scroll-bar-mode -1)  ; Hide the scroll bar for a sleeker appearance.

;; add mode to list
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . rjsx-mode))
;; Configuring C Programming Style:
(setq c-default-style "bsd")  ; Set the default C programming style to "bsd."
(setq c-basic-offset 8)  ; Specify an 8-space indentation for C code.
(setq tab-width 8)  ; Set the tab width to 8 characters.
(setq indent-tabs-mode t)  ; Indicate the use of tabs for indentation.

;; Disabling Backup and Auto-save Files:
(setq make-backup-files nil)  ; Prevent Emacs from creating backup files with names ending in "~."
(setq auto-save-default nil)  ; Disable the automatic creation of "#autosave#" files.

(when (display-graphic-p)
  (require 'all-the-icons))
;; Enabling Electric Pair Mode:
;;neotheme
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
(electric-pair-mode 1)  ; Enable Electric Pair mode to insert closing parentheses, brackets, or quotes automatically.

;; Enabling Electric Indent Mode:
(electric-indent-mode 1)  ; Activate Electric Indent mode for automatic indentation as you type.

;; Define a function to install packages if they're missing
(defun ensure-packages (packages)
  "Install missing packages from the list."
  (mapc
   (lambda (package)
     (unless (package-installed-p package)
       (package-install package)))
   packages))
;; Applying a Custom Theme:
;;(load-theme 'zerodark)  ; Load the 'zerodark' theme. You can replace 'zerodark' with your favorite theme.

;; Enabling Electric Quote Mode:
(electric-quote-mode 1)  ; Activate Electric Quote mode to convert straight quotes to curly quotes automatically.

;; By following these steps, you've customized your Emacs.
(add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode))
;; Feel free to further customize your configuration to meet your specific needs. Emacs is a highly customizable text editor, 
;; and these settings are just the beginning of tailoring it to your workflow.

;;KeyBindings
(global-set-key (kbd "C-q")'shell)
(global-set-key (kbd "C-x w") 'quit-window)
(global-set-key (kbd "C-x q") 'delete-trailing-whitespace)
(global-set-key (kbd "C-x t") 'neotree-toggle)
(global-set-key (kbd "C-x 9") 'eval-buffer)
(global-set-key (kbd "C-x C-u") 'uncomment-region)
;; ;; ;; Emacs setup emacs like VS-code and 

;;font size
(set-face-attribute 'default nil :height 110)
(global-display-line-numbers-mode 1)

;; ;; keybinding


(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(setq package-selected-packages '(lsp-mode yasnippet lsp-treemacs helm-lsp projectile hydra flycheck company avy which-key helm-xref dap-mode afternoon-theme json-mode))
(when (cl-find-if-not #'package-installed-p package-selected-packages)
  (package-refresh-contents)
  (mapc #'package-install package-selected-packages))
(load-theme 'afternoon t)
(helm-mode)
(require 'helm-xref)
(define-key global-map [remap find-file] #'helm-find-files)
(define-key global-map [remap execute-extended-command] #'helm-M-x)
(define-key global-map [remap switch-to-buffer] #'helm-mini)
(which-key-mode)
(add-hook 'prog-mode-hook #'lsp)
(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      company-idle-delay 0.0
      company-minimum-prefix-length 1
      create-lockfiles nil) ;; lock files will kill `npm start'
(with-eval-after-load 'lsp-mode
  (require 'dap-chrome)
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
  (yas-global-mode))
;; sample `helm' configuration use https://github.com/emacs-helm/helm/ for details
(helm-mode)
(require 'helm-xref)
(define-key global-map [remap find-file] #'helm-find-files)
(define-key global-map [remap execute-extended-command] #'helm-M-x)
(define-key global-map [remap switch-to-buffer] #'helm-mini)

(which-key-mode)
(add-hook 'c-mode-hook 'lsp)
(add-hook 'c++-mode-hook 'lsp)

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      treemacs-space-between-root-nodes nil
      company-idle-delay 0.0
      company-minimum-prefix-length 1
      lsp-idle-delay 0.1)  ;; clangd is fast

(with-eval-after-load 'lsp-mode
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
  (require 'dap-cpptools)
  (yas-global-mode))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("57e3f215bef8784157991c4957965aa31bac935aca011b29d7d8e113a652b693" default))
 '(ispell-dictionary nil)
 '(package-selected-packages
   '(prettier stylefmt js-react-redux-yasnippets rjsx-mode lsp-python-ms pylint afternoon-theme lsp-mode yasnippet lsp-treemacs helm-lsp projectile hydra flycheck company avy which-key helm-xref dap-mode zenburn-theme json-mode)))
;; Use package:
;; Install 'use-package' if not already installed
(require 'use-package)
(setq use-package-always-ensure t) ; Automatically install missing packages

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))


(when (display-graphic-p)
  (require 'all-the-icons))
    ;; #("js-icon" 0 1 (display (raise -0.24) face (:family "alltheicon" :height 1.08 :foreground "#FFD446")))
;; checks to see if emacs is running in a graphical environment as opposed to the terminal
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(setq package-selected-packages '(lsp-mode yasnippet lsp-treemacs helm-lsp projectile hydra flycheck company avy which-key helm-xref dap-mode afternoon-theme json-mode))
(when (cl-find-if-not #'package-installed-p package-selected-packages)
  (package-refresh-contents)
  (mapc #'package-install package-selected-packages))
(load-theme 'afternoon t)
(helm-mode)
(which-key-mode)
(add-hook 'prog-mode-hook #'lsp)
(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      company-idle-delay 0.0
      company-minimum-prefix-length 1
      create-lockfiles nil) ;; lock files will kill `npm start'
(with-eval-after-load 'lsp-modeg
  (require 'dap-chrome)
  (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)
  (yas-global-mode))
;; sample `helm' configuration use https://github.com/emacs-helm/helm/ for details
(helm-mode)
(require 'helm-xref)
(which-key-mode)
(add-hook 'c-mode-hook 'lsp)
(add-hook 'c++-mode-hook 'lsp)

;; CSS config
(use-package css-mode
  :ensure t
  :mode "\\.css\\'"
  :config
  ;; Add any specific configurations for CSS mode here
  (setq company-tooltip-align-annotations t)
  (setq company-minimum-prefix-length 1)
  (setq css-indent-offset 2))


;; Live server Configuratio
;; Function to start LiveServer for the current buffer's HTML file
(defun my-start-live-server ()
  "Start LiveServer for the current buffer's HTML file."
  (interactive)
  (when buffer-file-name
    (let* ((file-dir (file-name-directory buffer-file-name))
           (default-directory file-dir)
           (port 8080)) ; Change the port number if needed
      (shell-command (format "live-server --port=%d %s"
                             port
                             (shell-quote-argument (file-name-nondirectory buffer-file-name)))))))
;; Define a function to install packages if they're missing
(defun ensure-packages (packages)
  "Install missing packages from the list."
  (mapc
   (lambda (package)
     (unless (package-installed-p package)
       (package-install package)))
   packages))

;; Initialize package.el
(require 'package)
(setq package-archives '(("melpa" . "https://melpa.org/packages/")))
(package-initialize)

;; Ensure packages you need for React development
(ensure-packages '(web-mode
                   tide
                   company
                   prettier-js
                   flycheck))

;; Set up web-mode for JSX and React
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(setq web-mode-content-types-alist
      '(("jsx" . "\\.js[x]?\\'")
        ("tsx" . "\\.ts[x]?\\'")))
(setq web-mode-enable-auto-quoting nil)
(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)

;; Set up TypeScript with Tide
(require 'tide)
(add-hook 'typescript-mode-hook #'tide-setup)
(add-hook 'typescript-mode-hook #'tide-hl-identifier-mode)
(add-to-list 'auto-mode-alist '("\\.ts[x]?\\'" . typescript-mode))
(setq tide-format-options '(:indentSize 2 :tabSize 2))
(setq company-tooltip-align-annotations t)

;; Enable company-mode for autocompletion
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-tooltip-align-annotations t)
;; Set up Flycheck for syntax checking
(require 'flycheck)
(add-hook 'after-init-hook #'global-flycheck-mode)
;; Set up Prettier for code formatting
(require 'prettier-js)
(add-hook 'web-mode-hook #'prettier-js-mode)

;; Keybindings and customizations
(define-key web-mode-map (kbd "C-c C-f") 'prettier-js)
(define-key web-mode-map (kbd "C-c C-r") 'tide-restart-server)
(define-key web-mode-map (kbd "C-c C-k") 'tide-kill-server)

;; Customize indentation style (optional)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq js-indent-level 2)

;; ;; Enable auto-save
(setq auto-save-default t)

 


;; Ensure packages you need for React development
(ensure-packages '(web-mode
                   tide
                   company
                   prettier-js
                   flycheck))

;; Set up web-mode for JSX and React
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(setq web-mode-content-types-alist
      '(("jsx" . "\\.js[x]?\\'")
        ("tsx" . "\\.ts[x]?\\'")))
(setq web-mode-enable-auto-quoting nil)
(setq web-mode-markup-indent-offset 2)
(setq web-mode-css-indent-offset 2)
(setq web-mode-code-indent-offset 2)

;; Set up TypeScript with Tide
(require 'tide)
(add-hook 'typescript-mode-hook #'tide-setup)
(add-hook 'typescript-mode-hook #'tide-hl-identifier-mode)
(add-to-list 'auto-mode-alist '("\\.ts[x]?\\'" . typescript-mode))
(setq tide-format-options '(:indentSize 2 :tabSize 2))
(setq company-tooltip-align-annotations t)


;; Set up Prettier for code formatting
(require 'prettier-js)
(add-hook 'web-mode-hook #'prettier-js-mode)


;; Customize indentation style (optional)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq js-indent-level 2)

