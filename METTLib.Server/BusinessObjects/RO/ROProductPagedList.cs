// Generated 22 Feb 2021 08:24 - Singular Systems Object Generator Version 2.2.694
//<auto-generated/>
using System;
using Csla;
using Csla.Serialization;
using Csla.Data;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using Singular;
using System.Data;
using System.Data.SqlClient;
using Singular.Paging;

namespace MELib.RO
{
    [Serializable]
    public class ROProductPagedList
     : SingularReadOnlyListBase<ROProductPagedList, ROProductPaged>, IPagedList
    {
        #region " Business Methods "

        private int totalRecords = 0;

        public int TotalRecords
        {
            get { return this.totalRecords; }
        }

//' ** Example Paging property declaration code to be implemented in the necessary VM **
//'Public Property ROProductPagedList As ROProductPagedList
//'Public Property ROProductPagedListCriteria As ROProductPagedList.Criteria
//'Public Property ROProductPagedListManager As Singular.Web.Data.PagedDataManager(Of VMType)

//' ** Example Paging definition code to be implemented in the necessary VM Setup Method **
//'ROProductPagedList = New ROProductPagedList
//'ROProductPagedListCriteria = New ROProductPagedList.Criteria
//'ROProductPagedListManager = New Singular.Web.Data.PagedDataManager(Of VMType)(Function(d) d.ROProductPagedList, Function(d) d.ROProductPagedListCriteria, "SortBy", PageSize, SortAsc)

public ROProductPaged GetItem(int ProductID)
        {
            foreach (ROProductPaged child in this)
            {
                if (child.ProductID == ProductID)
                {
                    return child;
                }
            }
            return null;
        }

        public override string ToString()
        {
            return "RO Products";
        }

//        Private mTotalRecords As Integer = 0
   
//Public Readonly Property TotalRecords As Integer Implements Singular.Paging.IPagedList.TotalRecords
//Get
//Return mTotalRecords
//End Get
//End Property
        #endregion

        #region " Data Access "

[Serializable]
   public class Criteria
     : Singular.Paging.PageCriteria<Criteria>
        {
            public Criteria()
            {
            }

        }

        public static ROProductPagedList NewROProductPagedList()
        {
            return new ROProductPagedList();
        }

        public ROProductPagedList()
        {
            // must have parameter-less constructor
        }

        public static ROProductPagedList GetROProductPagedList()
        {
            return DataPortal.Fetch<ROProductPagedList>(new Criteria());
        }

        protected void Fetch(SafeDataReader sdr)
        {
            this.RaiseListChangedEvents = false;
            sdr.Read();
            int mTotalRecords = sdr.GetInt32(0);
            sdr.NextResult();
            this.IsReadOnly = false;
            while (sdr.Read())
            {
                this.Add(ROProductPaged.GetROProductPaged(sdr));
            }
            this.IsReadOnly = true;
            this.RaiseListChangedEvents = true;
        }

        protected override void DataPortal_Fetch(Object criteria)
        {
            Criteria crit = (Criteria)criteria;
            using (SqlConnection cn = new SqlConnection(Singular.Settings.ConnectionString))
            {
                cn.Open();
                try
                {
                    using (SqlCommand cm = cn.CreateCommand())
                    {
                        cm.CommandType = CommandType.StoredProcedure;
                        cm.CommandText = "GetProcs.getROProductPagedList";
                        crit.AddParameters(cm);
                    using (SafeDataReader sdr = new SafeDataReader(cm.ExecuteReader()))
                        {
                            Fetch(sdr);
                        }
                    }
                }
                finally
                {
                    cn.Close();
                }
            }
        }

        #endregion

    }

}