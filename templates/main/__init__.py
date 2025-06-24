# hal_inventory/blueprints/categories/__init__.py

from flask import Blueprint

categories_bp = Blueprint(
    'categories',
    __name__,
    template_folder='templates/categories'
)

from . import routes  # noqa: F401
