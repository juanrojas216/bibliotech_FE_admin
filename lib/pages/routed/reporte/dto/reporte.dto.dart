
class ReporteDto {
  DateTime? fechaDesde;
  DateTime? fechaHasta;
  
  ReporteDto({
    this.fechaDesde,
    this.fechaHasta,
  });

  Map<String, dynamic> toMap() {
    return {
      'fechaDesde': fechaDesde == null ? null :  "${fechaDesde!.year}-${fechaDesde!.month}-${fechaDesde!.day}",
      'fechaHasta': fechaHasta == null ? null : "${fechaHasta!.year}-${fechaHasta!.month}-${fechaHasta!.day}",
    };
  }
}
