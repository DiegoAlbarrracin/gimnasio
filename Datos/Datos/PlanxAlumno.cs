//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Datos
{
    using System;
    using System.Collections.Generic;
    
    public partial class PlanxAlumno
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public PlanxAlumno()
        {
            this.EjercicioPlanAlumno = new HashSet<EjercicioPlanAlumno>();
        }
    
        public int idPlanxAlumno { get; set; }
        public Nullable<int> idPlan { get; set; }
        public Nullable<int> idAlumno { get; set; }
        public Nullable<int> nro { get; set; }
        public Nullable<System.DateTime> fechaDesde { get; set; }
        public Nullable<System.DateTime> fechaHasta { get; set; }
        public Nullable<int> idProfesor { get; set; }
    
        public virtual Alumno Alumno { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<EjercicioPlanAlumno> EjercicioPlanAlumno { get; set; }
        public virtual Planes Planes { get; set; }
        public virtual Profesor Profesor { get; set; }
    }
}
