from flask import Blueprint

search_bp = Blueprint(
    'search',
    __name__,
    template_folder='templates'
)

from . import routes  # noqa: F401
