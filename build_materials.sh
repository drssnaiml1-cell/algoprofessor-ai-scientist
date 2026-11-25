#!/usr/bin/env bash
# Build every Sunday's student notes and Beamer slides into PDFs.
# Usage:  ./build_materials.sh          (all Sundays)
#         ./build_materials.sh 3        (only Sunday 3)
# Needs a TeX Live install with beamer, tcolorbox, listings and pgf/tikz.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")" && pwd)"
export TEXINPUTS="$ROOT/common//:"
for dir in "$ROOT"/sunday-0${1:-*}-*/; do
  for sub in notes slides; do
    for tex in "$dir$sub"/*.tex; do
      [ -e "$tex" ] || continue
      case "$tex" in *_Homework.tex) continue ;; esac   # included by the notes, not standalone
      ( cd "$dir$sub" && for i in 1 2; do pdflatex -interaction=nonstopmode -halt-on-error "$(basename "$tex")" > /dev/null; done
        rm -f *.aux *.log *.out *.nav *.snm *.toc *.vrb )
      echo "built ${tex%.tex}.pdf"
    done
  done
done
# Course introduction deck and syllabus (full build only)
if [ -z "${1:-}" ]; then
  ( cd "$ROOT/course-intro" && for i in 1 2; do pdflatex -interaction=nonstopmode -halt-on-error AlgoProfessor_AI_Scientist_Course_Intro.tex > /dev/null; done
    rm -f *.aux *.log *.out *.nav *.snm *.toc *.vrb ); echo "built course-intro/AlgoProfessor_AI_Scientist_Course_Intro.pdf"
  ( cd "$ROOT/syllabus" && for i in 1 2; do pdflatex -interaction=nonstopmode -halt-on-error AlgoProfessor_AI_Scientist_Syllabus.tex > /dev/null; done
    rm -f *.aux *.log *.out *.toc ); echo "built syllabus/AlgoProfessor_AI_Scientist_Syllabus.pdf"
fi
