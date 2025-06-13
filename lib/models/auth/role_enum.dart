enum RoleEnum {
  admin,
  trainer,
  guardian,
  athlete,
  unknown,
  referee,
  helper,
}

RoleEnum roleFromString(String role) {
  switch (role.toLowerCase()) {
    case "admin":
      return RoleEnum.admin;
    case "trainer":
      return RoleEnum.trainer;
    case "guardian":
      return RoleEnum.guardian;
    case "athlete":
      return RoleEnum.athlete;
    case "referee":
      return RoleEnum.referee;
    case "helper":
      return RoleEnum.helper;
    default:
      return RoleEnum.unknown;
  }
}
