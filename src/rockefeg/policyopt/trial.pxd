from .system cimport BaseSystem
from .domain cimport BaseDomain

cdef class ScoreEntry:
    cdef public double score
    cdef public Py_ssize_t n_epochs_elapsed
    cdef public Py_ssize_t n_training_episodes_elapsed
    cdef public Py_ssize_t n_training_steps_elapsed

cdef ScoreEntry new_ScoreEntry()

cdef class Trial:
    cdef public object system # BaseSystem
    cdef public object domain # BaseDomain
    cdef public object experiment_name
    cdef public object mod_name
    cdef public bint prints_score
    cdef public bint deletes_final_save_file
    cdef public double save_period
    cdef public Py_ssize_t n_training_episodes_elapsed
    cdef public Py_ssize_t n_epochs_elapsed
    cdef public Py_ssize_t n_training_steps_elapsed
    cdef public object datetime_str
    cdef public object log_dirname
    cdef public list score_history

    cpdef void save(self) except *

    cpdef void delete_final_save_file(self) except *

    cpdef void log_score_history(self) except *

    cpdef void run(self) except *
