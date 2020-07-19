;;; windswap.el --- Like windmove, but swaps buffers while moving point  -*- lexical-binding: t; -*-

;; Copyright (C) 2020  Steve Purcell

;; Author: Steve Purcell <steve@sanityinc.com>
;; Homepage: https://github.com/purcell/windswap
;; Keywords: frames, convenience
;; Package-Version: 0
;; Package-Requires: ((emacs "24.1"))

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; Provides commands analagous to `windmove' commands such as
;; `windmove-left' which also swap the buffers in the previous and new
;; windows.  This allows the user to "drag" the current buffer to
;; neighbouring windows.  The idea is to bind keys similarly to
;; `windmove', so that the two packages can be used interchangeably to
;; navigate and rearrange windows.

;;   (windmove-default-keybindings 'control)
;;   (windswap-default-keybindings 'control 'shift)

;;; Code:

(require 'windmove)

(defgroup windswap nil
  "Like windmove, but swaps buffers while moving point."
  :group 'frames)

;;;###autoload
(defun windswap-default-keybindings (&rest modifiers)
  "Set up keybindings for `windswap'.
Keybindings are of the form MODIFIERS-{left,right,up,down}.
Default MODIFIERS are `meta' and `shift'.
See also `windmove-default-keybindings'."
  (interactive)
  (unless modifiers (setq modifiers (list 'meta 'shift)))
  (global-set-key (vector (append modifiers '(left)))  'windswap-left)
  (global-set-key (vector (append modifiers '(right))) 'windswap-right)
  (global-set-key (vector (append modifiers '(up)))    'windswap-up)
  (global-set-key (vector (append modifiers '(down)))  'windswap-down))

(defun windswap--with-swap-window-buffers (func &optional args)
  "Run FUNC with ARGS, swapping window buffers afterwards."
  (let ((initial (selected-window)))
    (prog1
        (apply func args)
      (let ((new (selected-window)))
        (unless (eq initial new)
          (let ((initial-buf (window-buffer initial))
                (new-buf (window-buffer new)))
            (unless (eq initial-buf new-buf)
              (set-window-buffer initial new-buf)
              (set-window-buffer new initial-buf))))))))

;;;###autoload
(defun windswap-right (&optional arg)
  "Like `windmove-right', but transpose buffers after switching windows.
ARG is as for that function."
  (interactive "P")
  (windswap--with-swap-window-buffers 'windmove-right arg))

;;;###autoload
(defun windswap-left (&optional arg)
  "Like `windmove-left', but transpose buffers after switching windows.
ARG is as for that function."
  (interactive "P")
  (windswap--with-swap-window-buffers 'windmove-left arg))

;;;###autoload
(defun windswap-up (&optional arg)
  "Like `windmove-up', but transpose buffers after switching windows.
ARG is as for that function."
  (interactive "P")
  (windswap--with-swap-window-buffers 'windmove-up arg))

;;;###autoload
(defun windswap-down (&optional arg)
  "Like `windmove-down', but transpose buffers after switching windows.
ARG is as for that function."
  (interactive "P")
  (windswap--with-swap-window-buffers 'windmove-down arg))


(provide 'windswap)
;;; windswap.el ends here
