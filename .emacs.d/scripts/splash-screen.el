;;; splash-screen.el --- An alternative splash screen -*- lexical-binding: t; -*-

;; Copyright (C) 2020 Nicolas .P Rougier

;; Author: Nicolas P. Rougier <nicolas.rougier@inria.fr>
;; URL: https://github.com/rougier/emacs-splash
;; Keywords: startup
;; Version: 0.1
;; Package-Requires: 

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:
;;
;;  An alternative splash screen:
;;
;;  +–—————————––––––––––––––––––––––––––––————————————————————+
;;  |                                                          |
;;  |                                                          |
;;  |                                                          |
;;  |                                                          |
;;  |                                                          |
;;  |                                                          |
;;  |                       www.gnu.org                        |
;;  |                  GNU Emacs version XX.Y                  |
;;  |                   a free/libre editor                    |
;;  |                                                          |
;;  |                                                          |
;;  |                                                          |
;;  |                                                          |
;;  |                                                          |
;;  |        GNU Emacs comes with ABSOLUTELY NO WARRANTY       |
;;  |     Copyright (C) 2020 Free Software Foundation, Inc.    |
;;  |                                                          |
;;  +––––––––––––––––––––––––––––––––––––––————————————————————+
;;
;; Features:
;;
;;  - No logo, no moddeline, no scrollbars
;;  - "q" or <esc> kills the splash screen
;;  - Any other key open the about-emacs buffer
;;  - With emacs-mac (Mituharu), splash screen is faded out after 3 seconds
;;
;; Note: The screen is not shown if there are opened file buffers. For
;;       example, if you start emacs with a filename on the command
;;       line, the splash is not shown.
;;
;; Usage:
;; 
;;  (require 'splash-screen)
;;
;;; Code:
(require 'cl-lib)


(defun ss-emacs-0 ()
    (insert (propertize "ㅤ          _____                    _____                    _____                    _____                    _____          ㅤ"  'face 'bold))
    (center-line) (insert "\n")
    (insert (propertize "ㅤ         /\\    \\                  /\\    \\                  /\\    \\                  /\\    \\                  /\\    \\         ㅤ"  'face 'bold))
    (center-line) (insert "\n")
    (insert (propertize "ㅤ        /::\\    \\                /::\\____\\                /::\\    \\                /::\\    \\                /::\\    \\        ㅤ"  'face 'bold))
    (center-line) (insert "\n")
    (insert (propertize "ㅤ       /::::\\    \\              /::::|   |               /::::\\    \\              /::::\\    \\              /::::\\    \\       ㅤ"  'face 'bold))
    (center-line) (insert "\n")
    (insert (propertize "ㅤ      /::::::\\    \\            /:::::|   |              /::::::\\    \\            /::::::\\    \\            /::::::\\    \\      ㅤ"  'face 'bold))
    (center-line) (insert "\n")
    (insert (propertize "ㅤ     /:::/\\:::\\    \\          /::::::|   |             /:::/\\:::\\    \\          /:::/\\:::\\    \\          /:::/\\:::\\    \\     ㅤ"  'face 'bold))
    (center-line) (insert "\n")
    (insert (propertize "ㅤ    /:::/__\\:::\\    \\        /:::/|::|   |            /:::/__\\:::\\    \\        /:::/  \\:::\\    \\        /:::/__\\:::\\    \\    ㅤ"  'face 'bold))
    (center-line) (insert "\n")
    (insert (propertize "ㅤ   /::::\\   \\:::\\    \\      /:::/ |::|   |           /::::\\   \\:::\\    \\      /:::/    \\:::\\    \\       \\:::\\   \\:::\\    \\   ㅤ"  'face 'bold))
    (center-line) (insert "\n")
    (insert (propertize "ㅤ  /::::::\\   \\:::\\    \\    /:::/  |::|___|______    /::::::\\   \\:::\\    \\    /:::/    / \\:::\\    \\    ___\\:::\\   \\:::\\    \\  ㅤ"  'face 'bold))
    (center-line) (insert "\n")
    (insert (propertize "ㅤ /:::/\\:::\\   \\:::\\    \\  /:::/   |::::::::\\    \\  /:::/\\:::\\   \\:::\\    \\  /:::/    /   \\:::\\    \\  /\\   \\:::\\   \\:::\\    \\ ㅤ"  'face 'bold))
    (center-line) (insert "\n")
    (insert (propertize "ㅤ/:::/__\\:::\\   \\:::\\____\\/:::/    |:::::::::\\____\\/:::/  \\:::\\   \\:::\\____\\/:::/____/     \\:::\\____\\/::\\   \\:::\\   \\:::\\____\\ㅤ"  'face 'bold))
    (center-line) (insert "\n")
    (insert (propertize "ㅤ\\:::\\   \\:::\\   \\::/    /\\::/    / ~~~~~/:::/    /\\::/    \\:::\\  /:::/    /\\:::\\    \\      \\::/    /\\:::\\   \\:::\\   \\::/    /ㅤ"  'face 'bold))
    (center-line) (insert "\n")
    (insert (propertize "ㅤ \\:::\\   \\:::\\   \\/____/  \\/____/      /:::/    /  \\/____/ \\:::\\/:::/    /  \\:::\\    \\      \\/____/  \\:::\\   \\:::\\   \\/____/ ㅤ"  'face 'bold))
    (center-line) (insert "\n")
    (insert (propertize "ㅤ  \\:::\\   \\:::\\    \\                  /:::/    /            \\::::::/    /    \\:::\\    \\               \\:::\\   \\:::\\    \\     ㅤ"  'face 'bold))
    (center-line) (insert "\n")
    (insert (propertize "ㅤ   \\:::\\   \\:::\\____\\                /:::/    /              \\::::/    /      \\:::\\    \\               \\:::\\   \\:::\\____\\    ㅤ"  'face 'bold))
    (center-line) (insert "\n")
    (insert (propertize "ㅤ    \\:::\\   \\::/    /               /:::/    /               /:::/    /        \\:::\\    \\               \\:::\\  /:::/    /    ㅤ"  'face 'bold))
    (center-line) (insert "\n")
    (insert (propertize "ㅤ     \\:::\\   \\/____/               /:::/    /               /:::/    /          \\:::\\    \\               \\:::\\/:::/    /     ㅤ"  'face 'bold))
    (center-line) (insert "\n")
    (insert (propertize "ㅤ      \\:::\\    \\                  /:::/    /               /:::/    /            \\:::\\    \\               \\::::::/    /      ㅤ"  'face 'bold))
    (center-line) (insert "\n")
    (insert (propertize "ㅤ       \\:::\\____\\                /:::/    /               /:::/    /              \\:::\\____\\               \\::::/    /       ㅤ"  'face 'bold))
    (center-line) (insert "\n")
    (insert (propertize "ㅤ        \\::/    /                \\::/    /                \\::/    /                \\::/    /                \\::/    /        ㅤ"  'face 'bold))
    (center-line) (insert "\n")
    (insert (propertize "ㅤ         \\/____/                  \\/____/                  \\/____/                  \\/____/                  \\/____/         ㅤ"  'face 'bold))
    (center-line) (insert "\n")
    (insert (propertize "ㅤ                                                                                                                             ㅤ"  'face 'bold))
    (center-line) (insert "\n"))

(defun ss-emacs-1 ()
  (center-line) (insert "\n")(center-line) (insert "\n")(center-line) (insert "\n")(center-line) (insert "\n")(center-line) (insert "\n")(center-line) (insert "\n")(center-line) (insert "\n")(center-line) (insert "\n")
  (insert (propertize "ㅤ                                                     _..._               ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ                                                  .-'_..._''.            ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ       __.....__      __  __   ___              .' .'      '.\\           ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ   .-''         '.   |  |/  `.'   `.           / .'                      ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ  /     .-''\"'-.  `. |   .-.  .-.   '         . '                        ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ /     /________\\   \\|  |  |  |  |  |    __   | |                        ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ |                  ||  |  |  |  |  | .:--.'. | |                   _    ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ \\    .-------------'|  |  |  |  |  |/ |   \\ |. '                 .' |   ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ  \\    '-.____...---.|  |  |  |  |  |`\" __ | | \\ '.          .   .   | / ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ   `.             .' |__|  |__|  |__| .'.''| |  '. `._____.-'/ .'.'| |// ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ     `''-...... -'                   / /   | |_   `-.______ /.'.'.-'  /  ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ                                     \\ \\._,\\ '/            ` .'   \\_.'   ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ                                      `--'  `\"                           ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ                                                                                                                             ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  )
(defun ss-emacs-2 ()
  (center-line) (insert "\n")(center-line) (insert "\n")(center-line) (insert "\n")(center-line) (insert "\n")(center-line) (insert "\n")(center-line) (insert "\n")
  (insert (propertize "ㅤEEEEEEEEEEEEEEEEEEEEEEMMMMMMMM               MMMMMMMM               AAA                  CCCCCCCCCCCCC   SSSSSSSSSSSSSSS ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤE::::::::::::::::::::EM:::::::M             M:::::::M              A:::A              CCC::::::::::::C SS:::::::::::::::Sㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤE::::::::::::::::::::EM::::::::M           M::::::::M             A:::::A           CC:::::::::::::::CS:::::SSSSSS::::::Sㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤEE::::::EEEEEEEEE::::EM:::::::::M         M:::::::::M            A:::::::A         C:::::CCCCCCCC::::CS:::::S     SSSSSSSㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ  E:::::E       EEEEEEM::::::::::M       M::::::::::M           A:::::::::A       C:::::C       CCCCCCS:::::S            ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ  E:::::E             M:::::::::::M     M:::::::::::M          A:::::A:::::A     C:::::C              S:::::S            ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ  E::::::EEEEEEEEEE   M:::::::M::::M   M::::M:::::::M         A:::::A A:::::A    C:::::C               S::::SSSS         ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ  E:::::::::::::::E   M::::::M M::::M M::::M M::::::M        A:::::A   A:::::A   C:::::C                SS::::::SSSSS    ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ  E:::::::::::::::E   M::::::M  M::::M::::M  M::::::M       A:::::A     A:::::A  C:::::C                  SSS::::::::SS  ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ  E::::::EEEEEEEEEE   M::::::M   M:::::::M   M::::::M      A:::::AAAAAAAAA:::::A C:::::C                     SSSSSS::::S ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ  E:::::E             M::::::M    M:::::M    M::::::M     A:::::::::::::::::::::AC:::::C                          S:::::Sㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ  E:::::E       EEEEEEM::::::M     MMMMM     M::::::M    A:::::AAAAAAAAAAAAA:::::AC:::::C       CCCCCC            S:::::Sㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤEE::::::EEEEEEEE:::::EM::::::M               M::::::M   A:::::A             A:::::AC:::::CCCCCCCC::::CSSSSSSS     S:::::Sㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤE::::::::::::::::::::EM::::::M               M::::::M  A:::::A               A:::::ACC:::::::::::::::CS::::::SSSSSS:::::Sㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤE::::::::::::::::::::EM::::::M               M::::::M A:::::A                 A:::::A CCC::::::::::::CS:::::::::::::::SS ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤEEEEEEEEEEEEEEEEEEEEEEMMMMMMMM               MMMMMMMMAAAAAAA                   AAAAAAA   CCCCCCCCCCCCC SSSSSSSSSSSSSSS   ㅤ"  'face 'bold))
  (center-line) (insert "\n"))

(defun ss-emacs-3 ()
    (center-line) (insert "\n")(center-line) (insert "\n")(center-line) (insert "\n")(center-line) (insert "\n")(center-line) (insert "\n")(center-line) (insert "\n")(center-line) (insert "\n")(center-line) (insert "\n")(center-line) (insert "\n")(center-line) (insert "\n")(center-line) (insert "\n")(center-line) (insert "\n")(center-line) (insert "\n")
    (insert (propertize "ㅤ _______  _______  _______  _______  _______ ㅤ"  'face 'bold))
    (center-line) (insert "\n")
    (insert (propertize "ㅤ(  ____ \\(       )(  ___  )(  ____ \\(  ____ \\ㅤ"  'face 'bold))
    (center-line) (insert "\n")
    (insert (propertize "ㅤ| (    \\/| () () || (   ) || (    \\/| (    \\/ㅤ"  'face 'bold))
    (center-line) (insert "\n")
    (insert (propertize "ㅤ| (__    | || || || (___) || |      | (_____ ㅤ"  'face 'bold))
    (center-line) (insert "\n")
    (insert (propertize "ㅤ|  __)   | |(_)| ||  ___  || |      (_____  )ㅤ"  'face 'bold))
    (center-line) (insert "\n")
    (insert (propertize "ㅤ| (      | |   | || (   ) || |            ) |ㅤ"  'face 'bold))
    (center-line) (insert "\n")
    (insert (propertize "ㅤ| (____/\\| )   ( || )   ( || (____/\\/\\____) |ㅤ"  'face 'bold))
    (center-line) (insert "\n")
    (insert (propertize "ㅤ(_______/|/     \\||/     \\|(_______/\\_______)ㅤ"  'face 'bold))
    (center-line) (insert "\n")
    (insert (propertize "ㅤ                                             ㅤ"  'face 'bold))
    (center-line) (insert "\n"))

(defun ss-emacs-4 ()
  (center-line) (insert "\n")(center-line) (insert "\n")(center-line) (insert "\n")(center-line) (insert "\n")(center-line) (insert "\n")(center-line) (insert "\n")(center-line) (insert "\n")(center-line) (insert "\n")(center-line) (insert "\n")(center-line) (insert "\n")(center-line) (insert "\n")(center-line) (insert "\n")
  (insert (propertize "ㅤ    .-''-.  ,---.    ,---.   ____        _______      .-'''-.  ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ  .'_ _   \\ |    \\  /    | .'  __ `.    /   __  \\    / _     \\ ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ / ( ` )   '|  ,  \\/  ,  |/   '  \\  \\  | ,_/  \\__)  (`' )/`--' ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ. (_ o _)  ||  |\\_   /|  ||___|  /  |,-./  )       (_ o _).    ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ|  (_,_)___||  _( )_/ |  |   _.-`   |\\  '_ '`)      (_,_). '.  ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ'  \\   .---.| (_ o _) |  |.'   _    | > (_)  )  __ .---.  \\  : ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ \\  `-'    /|  (_,_)  |  ||  _( )_  |(  .  .-'_/  )\\    `-'  | ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ  \\       / |  |      |  |\\ (_ o _) / `-'`-'     /  \\       /  ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ   `'-..-'  '--'      '--' '.(_,_).'    `._____.'    `-...-'   ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ                                                               ㅤ"  'face 'bold))
  (center-line) (insert "\n"))

(defun ss-emacs-5 ()
  (center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")
  (insert (propertize "ㅤ__/\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\__/\\\\\\\\____________/\\\\\\\\_____/\\\\\\\\\\\\\\\\\\___________/\\\\\\\\\\\\\\\\\\_____/\\\\\\\\\\\\\\\\\\\\\\___        ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ _\\/\\\\\\///////////__\\/\\\\\\\\\\\\________/\\\\\\\\\\\\___/\\\\\\\\\\\\\\\\\\\\\\\\\\______/\\\\\\////////____/\\\\\\/////////\\\\\\_       ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ  _\\/\\\\\\_____________\\/\\\\\\//\\\\\\____/\\\\\\//\\\\\\__/\\\\\\/////////\\\\\\___/\\\\\\/____________\\//\\\\\\______\\///__      ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ   _\\/\\\\\\\\\\\\\\\\\\\\\\_____\\/\\\\\\\\///\\\\\\/\\\\\\/_\\/\\\\\\_\\/\\\\\\_______\\/\\\\\\__/\\\\\\_______________\\////\\\\\\_________     ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ    _\\/\\\\\\///////______\\/\\\\\\__\\///\\\\\\/___\\/\\\\\\_\\/\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\_\\/\\\\\\__________________\\////\\\\\\______    ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ     _\\/\\\\\\_____________\\/\\\\\\____\\///_____\\/\\\\\\_\\/\\\\\\/////////\\\\\\_\\//\\\\\\____________________\\////\\\\\\___   ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ      _\\/\\\\\\_____________\\/\\\\\\_____________\\/\\\\\\_\\/\\\\\\_______\\/\\\\\\__\\///\\\\\\___________/\\\\\\______\\//\\\\\\__  ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ       _\\/\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\_\\/\\\\\\_____________\\/\\\\\\_\\/\\\\\\_______\\/\\\\\\____\\////\\\\\\\\\\\\\\\\\\_\\///\\\\\\\\\\\\\\\\\\\\\\/___ ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ        _\\///////////////__\\///______________\\///__\\///________\\///________\\/////////____\\///////////_____ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  )

(defun ss-emacs-6 ()
  (center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")
  (insert (propertize "ㅤ        _____                                                                                ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ   _____\\    \\        ___________            _____                _____              _____   ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ  /    / |    |      /           \\         /      |_         _____\\    \\_       _____\\    \\  ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ /    /  /___/|     /    _   _    \\       /         \\       /     /|     |     /    / \\    | ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ|    |__ |___|/    /    //   \\\\    \\     |     /\\    \\     /     / /____/|    |    |  /___/| ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ|       \\         /    //     \\\\    \\    |    |  |    \\   |     | |____|/  ____\\    \\ |   || ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ|     __/ __     /     \\\\_____//     \\   |     \\/      \\  |     |  _____  /    /\\    \\|___|/ ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ|\\    \\  /  \\   /       \\ ___ /       \\  |\\      /\\     \\ |\\     \\|\\    \\|    |/ \\    \\      ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ| \\____\\/    | /________/|   |\\________\\ | \\_____\\ \\_____\\| \\_____\\|    ||\\____\\ /____/|     ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ| |    |____/||        | |   | |        || |     | |     || |     /____/|| |   ||    | |     ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ \\|____|   | ||________|/     \\|________| \\|_____|\\|_____| \\|_____|    || \\|___||____|/      ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ       |___|/                                                     |____|/                    ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  )

(defun ss-emacs-7 ()
  (center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")
  (insert (propertize "ㅤ         _           _   _         _                    _            _        ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ        /\\ \\        /\\_\\/\\_\\ _    / /\\                /\\ \\          / /\\      ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ       /  \\ \\      / / / / //\\_\\ / /  \\              /  \\ \\        / /  \\     ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ      / /\\ \\ \\    /\\ \\/ \\ \\/ / // / /\\ \\            / /\\ \\ \\      / / /\\ \\__  ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ     / / /\\ \\_\\  /  \\____\\__/ // / /\\ \\ \\          / / /\\ \\ \\    / / /\\ \\___\\ ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ    / /_/_ \\/_/ / /\\/________// / /  \\ \\ \\        / / /  \\ \\_\\   \\ \\ \\ \\/___/ ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ   / /____/\\   / / /\\/_// / // / /___/ /\\ \\      / / /    \\/_/    \\ \\ \\       ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ  / /\\____\\/  / / /    / / // / /_____/ /\\ \\    / / /         _    \\ \\ \\      ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ / / /______ / / /    / / // /_________/\\ \\ \\  / / /________ /_/\\__/ / /      ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ/ / /_______\\\\/_/    / / // / /_       __\\ \\_\\/ / /_________\\\\ \\/___/ /       ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ\\/__________/        \\/_/ \\_\\___\\     /____/_/\\/____________/ \\_____\\/        ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ                                                                              ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  )

(defun ss-emacs-8 ()
  (center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")
  (insert (propertize "ㅤ▓█████  ███▄ ▄███▓ ▄▄▄       ▄████▄    ██████ ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ▓█   ▀ ▓██▒▀█▀ ██▒▒████▄    ▒██▀ ▀█  ▒██    ▒ ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ▒███   ▓██    ▓██░▒██  ▀█▄  ▒▓█    ▄ ░ ▓██▄   ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ▒▓█  ▄ ▒██    ▒██ ░██▄▄▄▄██ ▒▓▓▄ ▄██▒  ▒   ██▒ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ░▒████▒▒██▒   ░██▒ ▓█   ▓██▒▒ ▓███▀ ░▒██████▒▒ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ░░ ▒░ ░░ ▒░   ░  ░ ▒▒   ▓▒█░░ ░▒ ▒  ░▒ ▒▓▒ ▒ ░ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ ░ ░  ░░  ░      ░  ▒   ▒▒ ░  ░  ▒   ░ ░▒  ░ ░ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ   ░   ░      ░     ░   ▒   ░        ░  ░  ░  ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ   ░  ░       ░         ░  ░░ ░            ░  ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ                            ░                 ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  )
(defun ss-emacs-9 ()
  (center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")
  (insert (propertize "ㅤ   ▄████████   ▄▄▄▄███▄▄▄▄      ▄████████  ▄████████    ▄████████ ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ  ███    ███ ▄██▀▀▀███▀▀▀██▄   ███    ███ ███    ███   ███    ███ ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ  ███    █▀  ███   ███   ███   ███    ███ ███    █▀    ███    █▀  ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ ▄███▄▄▄     ███   ███   ███   ███    ███ ███          ███        ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ▀▀███▀▀▀     ███   ███   ███ ▀███████████ ███        ▀███████████ ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ  ███    █▄  ███   ███   ███   ███    ███ ███    █▄           ███ ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ  ███    ███ ███   ███   ███   ███    ███ ███    ███    ▄█    ███ ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ  ██████████  ▀█   ███   █▀    ███    █▀  ████████▀   ▄████████▀  ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ                                                                  ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  )

(defun ss-emacs-10 ()
  (center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")
  (insert (propertize "ㅤ ▄▀▀█▄▄▄▄  ▄▀▀▄ ▄▀▄  ▄▀▀█▄   ▄▀▄▄▄▄   ▄▀▀▀▀▄ ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ▐  ▄▀   ▐ █  █ ▀  █ ▐ ▄▀ ▀▄ █ █    ▌ █ █   ▐ ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ  █▄▄▄▄▄  ▐  █    █   █▄▄▄█ ▐ █         ▀▄   ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ  █    ▌    █    █   ▄▀   █   █      ▀▄   █  ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ ▄▀▄▄▄▄   ▄▀   ▄▀   █   ▄▀   ▄▀▄▄▄▄▀  █▀▀▀   ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ █    ▐   █    █    ▐   ▐   █     ▐   ▐      ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ ▐        ▐    ▐            ▐                ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  )
(defun ss-emacs-11 ()
  (center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")
  (insert (propertize "ㅤ ____                                               ______                      ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ|                  .'. .`.             .'.        .~      ~.             ..'''' ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ|______          .'   `   `.         .''```.     |                    .''       ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ|              .'           `.     .'       `.   |                 ..'          ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ|___________ .'               `. .'           `.  `.______.' ....''             ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ                                                                                ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  )

(defun ss-emacs-12 ()
  (center-line) (insert "\n")	(center-line) (insert "\n")
  (insert (propertize "ㅤ                                                                               ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ     ##### ##       #####   ##    ##         ##          # ###      #######    ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ  ######  /### / ######  /#### #####      /####        /  /###  / /       ###  ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ /#   /  / ###/ /#   /  /  ##### #####   /  ###       /  /  ###/ /         ##  ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ/    /  /   ## /    /  /   # ##  # ##       /##      /  ##   ##  ##        #   ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ    /  /           /  /    #     #         /  ##    /  ###        ###          ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ   ## ##          ## ##    #     #         /  ##   ##   ##       ## ###        ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ   ## ##          ## ##    #     #        /    ##  ##   ##        ### ###      ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ   ## ######      ## ##    #     #        /    ##  ##   ##          ### ###    ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ   ## #####       ## ##    #     #       /      ## ##   ##            ### /##  ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ   ## ##          ## ##    #     ##      /######## ##   ##              #/ /## ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ   #  ##          #  ##    #     ##     /        ## ##  ##               #/ ## ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ      /              /     #      ##    #        ##  ## #      /          # /  ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ  /##/         / /##/      #      ##   /####      ##  ###     / /##        /   ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ /  ##########/ /  #####           ## /   ####    ## / ######/ /  ########/    ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ/     ######   /     ##              /     ##      #/    ###  /     #####      ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ#              #                     #                        |                ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ ##             ##                    ##                       \\)              ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ                                                                               ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ                                                                               ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  )

(defun ss-emacs-13 ()
  (center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")
  (insert (propertize "ㅤ                                                                 ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ                                                                 ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ          ,;                                        .,          .ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ        f#i                                        ,Wt         ;Wㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ      .E#t            ..       :           ..     i#D.        f#Eㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ     i#W,            ,W,     .Et          ;W,    f#f        .E#f ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ    L#D.            t##,    ,W#t         j##,  .D#i        iWW;  ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ  :K#Wfff;         L###,   j###t        G###, :KW,        L##Lffiㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ  i##WLLLLt      .E#j##,  G#fE#t      :E####, t#f        tLLG##L ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ   .E#L         ;WW; ##,:K#i E#t     ;W#DG##,  ;#G         ,W#i  ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ     f#E:      j#E.  ##f#W,  E#t    j###DW##,   :KE.      j#E.   ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ      ,WW;   .D#L    ###K:   E#t   G##i,,G##,    .DW:   .D#j     ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ       .D#; :K#t     ##D.    E#t :K#K:   L##,      L#, ,WK,      ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ         tt ...      #G      .. ;##D.    L##,       jt EG.       ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ                     j          ,,,      .,,           ,         ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ                                                                 ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  )


(defun ss-emacs-15 ()
  (center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")	(center-line) (insert "\n")
  (insert (propertize "ㅤ               _,.,  °        ,·'´¨;.  '                                   ,.,   '                   ,. - .,                      ,. -,    ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ        ,.·'´  ,. ,  `;\\ '      ;   ';:\\           .·´¨';\\                 ;´   '· .,             ,·'´ ,. - ,   ';\\            ,.·'´,    ,'\\   ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ      .´   ;´:::::\\`'´ \\'\\     ;     ';:'\\      .'´     ;:'\\              .´  .-,    ';\\       ,·´  .'´\\:::::;'   ;:'\\ '     ,·'´ .·´'´-·'´::::\\' ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ     /   ,'::\\::::::\\:::\\:'    ;   ,  '·:;  .·´,.´';  ,'::;'             /   /:\\:';   ;:'\\'    /  ,'´::::'\\;:-/   ,' ::;  '  ;    ';:::\\::\\::;:'  ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ    ;   ;:;:-·'~^ª*';\\'´     ;   ;'`.    ¨,.·´::;'  ;:::;            ,'  ,'::::'\\';  ;::';  ,'   ;':::::;'´ ';   /\\::;' '    \\·.    `·;:'-·'´     ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ    ;  ,.-·:*'´¨'`*´\\::\\ '    ;  ';::; \\*´\\:::::;  ,':::;‘        ,.-·'  '·~^*'´¨,  ';::;  ;   ;:::::;   '\\*'´\\::\\'  °     \\:`·.   '`·,  '     ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ   ;   ;\\::::::::::::'\\;'    ';  ,'::;   \\::\\;:·';  ;:::; '        ':,  ,·:²*´¨¯'`;  ;::';  ';   ';::::';    '\\::'\\/.'          `·:'`·,   \\'      ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ   ;  ;'_\\_:;:: -·^*';\\    ;  ';::;     '*´  ;',·':::;‘          ,'  / \\::::::::';  ;::';   \\    '·:;:'_ ,. -·'´.·´\\‘         ,.'-:;'  ,·\\     ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ   ';    ,  ,. -·:*'´:\\:'\\°  \\´¨\\::;          \\¨\\::::;          ,' ,'::::\\·²*'´¨¯':,'\\:;     '\\:` ·  .,.  -·:´::::::\\'   ,·'´     ,.·´:::'\\    ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ    \\`*´ ¯\\:::::::::::\\;' '  '\\::\\;            \\:\\;·'           \\`¨\\:::/          \\::\\'       \\:::::::\\:::::::;:·'´'     \\`*'´\\::::::::;·'‘   ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ      \\:::::\\;::-·^*'´         '´¨               ¨'              '\\::\\;'            '\\;'  '       `· :;::\\;::-·´           \\::::\\:;:·´        ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  (insert (propertize "ㅤ        `*´¯                                                     `¨'                                                     '`*'´‘            ㅤ"  'face 'bold))
  (center-line) (insert "\n")
  )

(defun ss-lil-emacs ()
  (center-line) (insert "\n")
  (inser (propertize "EMACS")))

(setq ss-functions (list #'ss-emacs-0 #'ss-emacs-1 #'ss-emacs-2 #'ss-emacs-3 #'ss-emacs-4
			 #'ss-emacs-5 #'ss-emacs-6 #'ss-emacs-7 #'ss-emacs-8 #'ss-emacs-9
			 #'ss-emacs-10 #'ss-emacs-11 #'ss-emacs-12 #'ss-emacs-13
			 #'ss-emacs-15))

(defun splash-screen ()
  "Emacs splash screen"
  
  (interactive)
  (let* ((splash-buffer  (get-buffer-create "*splash*"))
         (recover-session (and auto-save-list-file-prefix
                               (file-directory-p (file-name-directory
                                                  auto-save-list-file-prefix))))
         (height         (- (window-body-height nil) 1))
         (width          (window-body-width nil))
         (padding-center (- (/ height 2) 1))
	 (padding-top (- (/ height 10) 1))
         (padding-bottom (- height (/ (* height 5) 6))))

    ;; If there are buffer associated with filenames,
    ;;  we don't show splash screen.
    (if (eq 0 (length (cl-loop for buf in (buffer-list)
                              if (buffer-file-name buf)
                              collect (buffer-file-name buf))))
        
        (with-current-buffer splash-buffer
          (erase-buffer)
          
          ;; Buffer local settings
          (if (one-window-p)
              (setq mode-line-format nil))
          (setq cursor-type nil)
          (setq vertical-scroll-bar nil)
          (setq horizontal-scroll-bar nil)
          (setq fill-column width)
          (face-remap-add-relative 'link :underline nil)

          ;; Vertical padding to center
          (insert-char ?\n padding-top)

	  (if (> width 160)
      	      (funcall (nth (random (length ss-functions)) ss-functions))
	    'nil)

	  (if (<= width 160)
	      (ss-emacs-8)
	    'nil)

	  (insert-char ?\n padding-bottom)
	  	  
          ;; Central text
	  (insert (propertize "Emacs Emacs Emacs Emacs Emacs Emacs Emacs Emacs Emacs Emacs Emacs Emacs"  'face 'bold))
	  (center-line) (insert "\n")
          (insert-text-button "Emacs Emacs Emacs Emacs Emacs Emacs Emacs Emacs Emacs Emacs Emacs Emacs"
                     'action (lambda (_) (browse-url "https://www.gnu.org"))
                     'help-echo "Visit www.gnu.org website"
                     'follow-link t)
          (center-line) (insert "\n")
          (insert (propertize "Emacs Emacs Emacs Emacs Emacs Emacs Emacs Emacs Emacs Emacs Emacs Emacs"  'face 'bold))
          (center-line) (insert "\n")
          (insert (propertize "Emacs Emacs Emacs Emacs Emacs Emacs Emacs Emacs Emacs Emacs Emacs Emacs" 'face 'shadow))
          (center-line) (insert "\n")
          (insert (propertize "Emacs Emacs Emacs Emacs Emacs Emacs Emacs Emacs Emacs Emacs Emacs Emacs"  'face 'bold))
          (center-line) (insert "\n")
          (insert (propertize "Emacs Emacs Emacs Emacs Emacs Emacs Emacs Emacs Emacs Emacs Emacs Emacs" 'face 'shadow))
          (center-line)


          ;; Vertical padding to bottom
          (insert-char ?\n padding-bottom)

          ;; Recover session button
          (when recover-session
            (delete-char -2)
            (insert-text-button " [Emacs Emacs Emacs] "
                 'action (lambda (_) (call-interactively 'recover-session))
                   'help-echo "Recover previous session"
                   'face 'warning
                   'follow-link t)
            (center-line) (insert "\n") (insert "\n"))

          ;; Copyright text
          (insert (propertize
                   "Emcacs Emcacs Emcacs Emcacs Emcacs Emcacs Emcacs" 'face 'shadow))
          (center-line) (insert "\n")
          (insert (propertize
                   "Emcacs Emcacs Emcacs Emcacs Emcacs Emcacs Emcacs Emcacs" 'face 'shadow))
          (center-line) (insert "\n")

          (goto-char 0)
          (read-only-mode t)
          
          ;; (local-set-key [t]               'splash-screen-fade-to-about)
          ;; (local-set-key (kbd "C-[")       'splash-screen-fade-to-default)
          ;; (local-set-key (kbd "<escape>")  'splash-screen-fade-to-default)
          ;; (local-set-key (kbd "q")         'splash-screen-fade-to-default)
          ;; (local-set-key (kbd "<mouse-1>") 'mouse-set-point)
          ;; (local-set-key (kbd "<mouse-2>") 'operate-this-button)
          ;; (local-set-key " "               'splash-screen-fade-to-default)
          ;; (local-set-key "x"               'splash-screen-fade-to-default)
          ;; (local-set-key (kbd "<RET>")     'splash-screen-fade-to-default)
          ;; (local-set-key (kbd "<return>")  'splash-screen-fade-to-default)
          (display-buffer-same-window splash-buffer nil)
          ;; (run-with-idle-timer 10.0 nil    'splash-screen-fade-to-about)
	  ))))


;; Mac animation, only available from
;;  https://bitbucket.org/mituharu/emacs-mac/src/master/
;;  https://github.com/railwaycat/homebrew-emacsmacport
(defvar mac-animation-locked-p nil)
(defun mac-animation-toggle-lock ()
  (setq mac-animation-locked-p (not mac-animation-locked-p)))
(defun mac-animation-fade-out (duration &rest args)
  (unless mac-animation-locked-p
    (mac-animation-toggle-lock)
    (mac-start-animation nil :type 'fade-out :duration duration)
    (run-with-timer duration nil 'mac-animation-toggle-lock)))

(defun splash-screen-fade-to (about duration)
  "Fade out current frame for duration and goes to command-or-bufffer"
  (interactive)
  (defalias 'mac-animation-fade-out-local
    (apply-partially 'mac-animation-fade-out duration))
  (if (get-buffer "*splash*")
      (progn (if (and (display-graphic-p) (fboundp 'mac-start-animation))
                 (advice-add 'set-window-buffer
                             :before 'mac-animation-fade-out-local))
             (if about (about-emacs))
             (kill-buffer "*splash*")
             (if (and (display-graphic-p) (fboundp 'mac-start-animation))
                 (advice-remove 'set-window-buffer
                                'mac-animation-fade-out-local)))))
(defun splash-screen-fade-to-about ()
  (interactive) (splash-screen-fade-to nil 1.0))
(defun splash-screen-fade-to-default ()
  (interactive) (splash-screen-fade-to nil 0.25))

(defun splash-screen-kill ()
  "Kill the splash screen buffer (immediately)."
  (interactive)
  (if (get-buffer "*splash*")
        (kill-buffer "*splash*")))

;; Suppress any startup message in the echo area
(run-with-idle-timer 0.05 nil (lambda() (message nil)))

;; Install hook after frame parameters have been applied and only if
;; no option on the command line
(if (and (not (member "-no-splash"  command-line-args))
         (not (member "--file"      command-line-args))
         (not (member "--insert"    command-line-args))
         (not (member "--find-file" command-line-args))
         (not inhibit-startup-screen)
         )
    (progn
      (add-hook 'window-setup-hook 'splash-screen)
      (setq inhibit-startup-screen t 
            inhibit-startup-message t
            inhibit-startup-echo-area-message t)))

(provide 'splash-screen)
;;; splash-screen.el ends here
