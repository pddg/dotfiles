function bobthefish_colors -S -d 'Define a custom bobthefish color scheme'

  # Define color scheme

  # Normal colors
  set -l argo_black 2e2e2e
  set -l argo_red ff260d
  set -l argo_green 9ae204
  set -l argo_yellow ffc400
  set -l argo_blue 00a1f9
  set -l argo_magenta 805bb5
  set -l argo_cyan 00ddef
  set -l argo_white cccccc

  # Bright colors
  set -l argo_brblack 555555
  set -l argo_brred ff4250
  set -l argo_brgreen b8e36d
  set -l argo_bryellow ffd852
  set -l argo_brblue 00a5ff
  set -l argo_brmagenta ab7aef
  set -l argo_brcyan 74fcf3
  set -l argo_brwhite feffff

  # Optionally include a base color scheme
  # __bobthefish_colors default

  # Then override everything you want!
  # Note that these must be defined with `set -x`
  set -x color_initial_segment_exit     $argo_brwhite $argo_red --bold
  set -x color_initial_segment_su       $argo_brwhite $argo_green --bold
  set -x color_initial_segment_jobs     $argo_brwhite $argo_blue --bold

  set -x color_path                     $argo_black $argo_white
  set -x color_path_basename            $argo_black $argo_brwhite --bold
  set -x color_path_nowrite             $argo_magenta $argo_white
  set -x color_path_nowrite_basename    $argo_magenta $argo_brwhite --bold

  set -x color_repo                     $argo_brgreen $argo_black
  set -x color_repo_work_tree           $argo_black $argo_black --bold
  set -x color_repo_dirty               $argo_brred $argo_brwhite
  set -x color_repo_staged              $argo_bryellow $argo_black

  set -x color_vi_mode_default          $argo_brgreen $argo_black --bold
  set -x color_vi_mode_insert           $argo_brblue $argo_brwhite --bold
  set -x color_vi_mode_visual           $argo_yellow $argo_brblack --bold

  set -x color_vagrant                  $argo_brcyan $argo_black
  set -x color_k8s                      $argo_magenta $argo_white --bold
  set -x color_username                 $argo_white $argo_black --bold
  set -x color_hostname                 $argo_white $argo_black
  set -x color_rvm                      $argo_brmagenta $argo_black --bold
  set -x color_virtualfish              $argo_blue $argo_brwhite
  set -x color_virtualgo                $argo_blue $argo_brwhite
  set -x color_desk                     $argo_brblue $argo_brwhite
end
