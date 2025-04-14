class MyOrderStatusClass{
  static String activeId = "active";
  static String pendingId = "pending";
  static String completedId = "completed";
  static String cancelledId = "cancelled";

  static String activeName = "Active";
  static String pendingName = "Pending";
  static String completedName = "Completed";
  static String cancelledName = "Cancelled";

  static final myOrderStatusList = [
    {
      "id": activeId,
      "name": activeName
    },
    {
      "id": pendingId,
      "name": pendingName,
    },
    {
      "id": completedId,
      "name": completedName,
    },
    {
      "id": cancelledId,
      "name": cancelledName,
    }
  ];

}