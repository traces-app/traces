enum NotificationType {
  arrived("Arrived"),
  outForDelivery("Out for Delivery"),
  delivered("Delivered"),
  canceled("Canceled"),
  shipmentCreated("Shipment Created");

  /*
  inTransit("In Transit"),
  processing("Processing"),
  onHold("On Hold"),
  returned("Returned"),
  delayed("Delayed"),
  rescheduled("Rescheduled"),
  failedDelivery("Failed Delivery"),
  readyForPickup("Ready for Pickup"),
  dispatched("Dispatched"),
  customsClearance("Customs Clearance"),
  damaged("Damaged"),
  lost("Lost"),
  outForReturn("Out for Return"),
  deliveryAttempted("Delivery Attempted"),
  shipmentUpdated("Shipment Updated");
  */

  final String label; // Custom label for display

  const NotificationType(this.label);
}
