import 'dart:ffi';

import 'package:validators/validators.dart';

//추후 수정

Function validateUsername() {
  return (String? value) {

    if (value!.isEmpty) {
      return "유저네임에 들어갈 수 없습니다.";
    } else if (!isAlphanumeric(value)) {
      return "유저네임에 한글이나 특수 문자가 들어갈 수 없습니다.";
    } else if (value.length > 12) {
      return "유저네임의 길이를 초과하였습니다.";
    } else if (value.length < 3) {
      return "유저네임의 최소 길이는 3자입니다.";
    } else {
      return null;
    }
  };
}

Function validatePassword() {
  return (String? value) {
    if (value!.isEmpty) {
      return "패스워드 공백이 들어갈 수 없습니다.";
    } else if (value.length > 12) {
      return "패스워드의 길이를 초과하였습니다.";
    } else if (value.length < 4) {
      return "패스워드의 최소 길이는 4자입니다.";
    } else {
      return null;
    }
  };
}

Function validateEmail() {
  return (String? value) {
    if (value!.isEmpty) {
      return "이메일은 공백이 들어갈 수 없습니다.";
    } else if (!isEmail(value)) {
      return "이메일 형식에 맞지 않습니다.";
    } else {
      return null;
    }
  };
}

Function validateTitle() {
  return (String? value) {
    if (value!.isEmpty) {
      return "제목은 공백이 들어갈 수 없습니다.";
    } else if (value.length > 30) {
      return "제목의 길이를 초과하였습니다.";
    } else {
      return null;
    }
  };
}

Function validateTag() {
  return (String? value) {
    if (value!.isEmpty) {
      return null;
    } else if (value.length > 10) {
      return "태그의 길이를 초과하였습니다.";
    } else {
      return null;
    }
  };
}


Function validateContent() {
  return (String? value) {
    if (value!.isEmpty) {
      return "내용은 공백이 들어갈 수 없습니다.";
    } else if (value.length > 500) {
      return "내용의 길이를 초과하였습니다.";
    } else {
      return null;
    }
  };
}

Function validateNikename() {
  return (String? value) {
    if (value!.isEmpty) {
      return "내용은 공백이 들어갈 수 없습니다.";
    } else if (value.length > 10) {
      return "내용의 길이를 초과하였습니다.";
    } else {
      return null;
    }
  };
}

Function validateCount() {
  return (String? value) {
    if (value!.isEmpty) {
      return "수량을 입력해주세요";
    } else if (int.parse(value) > 100) {
      return "최대 수량은 100개 입니다.";
    } else {
      return null;
    }
  };
}
Function validateAccount() {
  return (String? value) {
    if (value!.isEmpty) {
      return "공백이 들어갈 수 없습니다.";
    } else if (value.length <= 10) {
      return "최소 10자리";
    } else if (value.length >= 14) {
      return "최대 14자리";
    } else {
      return null;
    }
  };
}

Function validPrice() {
  return (String? value) {
    if (value!.isEmpty) {
      return "작성해주세요";
    } else {
      return null;
    }
  };
}
Function validBoardContent() {
  return (String? value) {
    if (value!.isEmpty) {
      return "내용은 공백이 들어갈 수 없습니다.";
    } else if (value.length < 10 ) {
      return "최소 10글자를 작성하여야 합니다.";
    }else if (value.length > 500) {
      return "내용의 길이를 초과하였습니다.";
    } else {
      return null;
    }
  };
}