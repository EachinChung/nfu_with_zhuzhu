from flask import Blueprint, jsonify

from nfu.extensions import db
from nfu.models import Power
from nfu.token import validate_token

validate_bp = Blueprint('validate', __name__)


@validate_bp.route('/email/<string:token>')
def email(token: str):
    """
    验证邮箱合法性，并激活账号
    因为有账号才能拿到token，故不考虑，账号不存在的情况
    :param token: 激活邮箱的token
    :return: json
    """
    validate = validate_token(token, 'EMAIL_TOKEN')

    # 验证 token 是否通过
    if not validate[0]:
        return jsonify({'message': validate[1]}), 403

    # 获取用户权限表
    # 验证邮箱是否激活
    user_power = Power.query.get(validate[1]['id'])
    if user_power.validate_email:
        return jsonify({'message': '该账号已激活'}), 500

    user_power.validate_email = True
    db.session.add(user_power)
    db.session.commit()
    return jsonify({'message': 'success'})
