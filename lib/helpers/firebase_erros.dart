String getErrorString(String code){
  switch (code) {
    case 'weak_password':
      return 'Sua senha é muito fraca.';
    case 'invalid_email':
      return 'Seu e-mail é inválido.';
    case 'email_already_in_use':
      return 'E-mail já está sendo utilizado em outra conta.';
    case 'invalid_credential':
      return 'Seu e-mail é inválido.';
    case 'wrong-password':
      return 'Sua senha está incorreta.';
    case 'user_not_found':
      return 'Não há usuário com este e-mail.';
    case 'user_disabled':
      return 'Este usuário foi desabilitado.';
    case 'too-many-requests':
      return 'Muitas solicitações. Tente novamente mais tarde.';
    case 'operation-not-allowed':
      return 'Operação não permitida.';

    default:
      return 'Um erro indefinido ocorreu.';
  }
}