from flask import Blueprint

analytics_bp = Blueprint(
    'analytics',
    __name__,
    template_folder='templates/analytics',
    url_prefix='/analytics'
)

from . import routes  # noqa: F401
