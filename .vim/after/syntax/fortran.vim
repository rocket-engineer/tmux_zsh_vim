
" Supplemental fortran highlighting
syn keyword fortranType character


" MPI highlighting
syn match MPI "MPI_[A-Z][A-Z_a-z2 ]*("me=e-1
syn match MPI "MPIO_[A-Z][A-Z_a-z ]*("me=e-1
" syn match MPI "pvm_[a-z ]*("me=e-1
" syn match MPI "MP_[A-Z_a-z ]*("me=e-1

syn keyword MPI MPI_Group MPI_Status MPI_Request MPI_Win MPI_Aint
syn keyword MPI MPI_Info MPI_Op MPI_Datatype MPI_Comm


" OpenMP highlighting
syn match OpenMP "omp_[A-Z][A-Z_a-z2 ]*("me=e-1
" syn match OpenMP "MPIO_[A-Z][A-Z_a-z ]*("me=e-1
" syn match OpenMP "pvm_[a-z ]*("me=e-1
" syn match OpenMP "MP_[A-Z_a-z ]*("me=e-1

syn region fortranDirective start=/!$omp.\{-}/ end=/[^\&]$/

hi def link fortranDirective OpenMP
