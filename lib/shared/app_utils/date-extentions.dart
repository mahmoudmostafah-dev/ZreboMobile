extension DateTimeExtension on DateTime {
  String getMonthString() {
    switch (month) {
      case 1:
        return 'Jan.';
      case 2:
        return 'Feb.';
      case 3:
        return 'Mar.';
      case 4:
        return 'Apr.';
      case 5:
        return 'May';
      case 6:
        return 'Jun.';
      case 7:
        return 'Jul.';
      case 8:
        return 'Aug.';
      case 9:
        return 'Sept.';
      case 10:
        return 'Oct.';
      case 11:
        return 'Nov.';
      case 12:
        return 'Dec.';
      default:
        return 'Err';
    }
  }

  String getDayString() {
    switch (day) {
      case 1:
        return 'monday';
      case 2:
        return 'tuesday';
      case 3:
        return 'wednesday';
      case 4:
        return 'thursday';
      case 5:
        return 'friday';
      case 6:
        return 'saturday';
      case 7:
        return 'sunday';
      default:
        return 'Err';
    }
  }

  String getDayArString() {
    switch (day) {
      case 1:
        return 'الاتنين';
      case 2:
        return 'الثلاثاء';
      case 3:
        return 'الاربعاء';
      case 4:
        return 'الخميس';
      case 5:
        return 'الجمعة';
      case 6:
        return 'السبت';
      case 7:
        return 'الاحد';
      default:
        return 'Err';
    }
  }
}
