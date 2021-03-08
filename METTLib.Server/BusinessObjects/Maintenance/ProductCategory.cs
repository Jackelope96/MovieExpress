﻿// Generated 11 Feb 2021 11:21 - Singular Systems Object Generator Version 2.2.694
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
using Singular.DataAnnotations;

namespace MELib.Maintenance
{
    [Serializable]
    public class ProductCategory
     : MEBusinessBase<ProductCategory>
    {
        #region " Properties and Methods "

        #region " Properties "

        public static PropertyInfo<int> ProductCategoryIDProperty = RegisterProperty<int>(c => c.ProductCategoryID, "ID", 0);
        /// <summary>
        /// Gets the ID value
        /// </summary>
        [Display(AutoGenerateField = false), Key]
        public int ProductCategoryID
        {
            get { return GetProperty(ProductCategoryIDProperty); }
        }

        public static PropertyInfo<String> CategoryNameProperty = RegisterProperty<String>(c => c.CategoryName, "Category Name", "");
        /// <summary>
        /// Gets and sets the Category Name value
        /// </summary>
        /// 
        //my code edit - commenting this out to test new code

        //[Display(Name = "Category Name", Description = ""),
        //StringLength(50, ErrorMessage = "Category Name cannot be more than 50 characters")]'

        [Display(Name = "Product Category", Description = ""),
        Required(ErrorMessage = "Product Category required")]
        [DropDownWeb(typeof(MELib.RO.ROProductCategoryList), Source = Singular.DataAnnotations.DropDownWeb.SourceType.CommonData,
         DisplayMember = "CategoryName", ValueMember = "ProductCategoryID", UnselectedText = "Choose a category")]

        public String CategoryName
        {
            get { return GetProperty(CategoryNameProperty); }
            set { SetProperty(CategoryNameProperty, value); }
        }

        

        public static PropertyInfo<Boolean?> IsActiveIndProperty = RegisterProperty<Boolean?>(c => c.IsActiveInd, "Is Active", null);
        /// <summary>
        /// Gets and sets the Is Active value
        /// </summary>
        [Display(Name = "Is Active", Description = "")]
        public Boolean? IsActiveInd
        {
            get { return GetProperty(IsActiveIndProperty); }
            set { SetProperty(IsActiveIndProperty, value); }
        }

        public static PropertyInfo<DateTime?> DeletedDateProperty = RegisterProperty<DateTime?>(c => c.DeletedDate, "Deleted Date");
        /// <summary>
        /// Gets and sets the Deleted Date value
        /// </summary>
        [Display(Name = "Deleted Date", Description = "")]
        public DateTime? DeletedDate
        {
            get
            {
                return GetProperty(DeletedDateProperty);
            }
            set
            {
                SetProperty(DeletedDateProperty, value);
            }
        }

        public static PropertyInfo<int> DeletedByProperty = RegisterProperty<int>(c => c.DeletedBy, "Deleted By", 0);
        /// <summary>
        /// Gets and sets the Deleted By value
        /// </summary>
        [Display(Name = "Deleted By", Description = "")]
        public int DeletedBy
        {
            get { return GetProperty(DeletedByProperty); }
            set { SetProperty(DeletedByProperty, value); }
        }

        public static PropertyInfo<SmartDate> CreatedDateProperty = RegisterProperty<SmartDate>(c => c.CreatedDate, "Created Date", new SmartDate(DateTime.Now));
        /// <summary>
        /// Gets the Created Date value
        /// </summary>
        [Display(AutoGenerateField = false)]
        public SmartDate CreatedDate
        {
            get { return GetProperty(CreatedDateProperty); }
        }

        public static PropertyInfo<int> CreatedByProperty = RegisterProperty<int>(c => c.CreatedBy, "Created By", 0);
        /// <summary>
        /// Gets the Created By value
        /// </summary>
        [Display(AutoGenerateField = false)]
        public int CreatedBy
        {
            get { return GetProperty(CreatedByProperty); }
        }

        public static PropertyInfo<SmartDate> ModifiedDateProperty = RegisterProperty<SmartDate>(c => c.ModifiedDate, "Modified Date", new SmartDate(DateTime.Now));
        /// <summary>
        /// Gets the Modified Date value
        /// </summary>
        [Display(AutoGenerateField = false)]
        public SmartDate ModifiedDate
        {
            get { return GetProperty(ModifiedDateProperty); }
        }

        public static PropertyInfo<int> ModifiedByProperty = RegisterProperty<int>(c => c.ModifiedBy, "Modified By", 0);
        /// <summary>
        /// Gets the Modified By value
        /// </summary>
        [Display(AutoGenerateField = false)]
        public int ModifiedBy
        {
            get { return GetProperty(ModifiedByProperty); }
        }

        #endregion

        #region " Methods "

        protected override object GetIdValue()
        {
            return GetProperty(ProductCategoryIDProperty);
        }

        public override string ToString()
        {
            if (this.CategoryName.Length == 0)
            {
                if (this.IsNew)
                {
                    return String.Format("New {0}", "Product Category");
                }
                else
                {
                    return String.Format("Blank {0}", "Product Category");
                }
            }
            else
            {
                return this.CategoryName;
            }
        }

        #endregion

        #endregion

        #region " Validation Rules "

        protected override void AddBusinessRules()
        {
            base.AddBusinessRules();
        }

        #endregion

        #region " Data Access & Factory Methods "

        protected override void OnCreate()
        {
            // This is called when a new object is created
            // Set any variables here, not in the constructor or NewProductCategory() method.
        }

        public static ProductCategory NewProductCategory()
        {
            return DataPortal.CreateChild<ProductCategory>();
        }

        public ProductCategory()
        {
            MarkAsChild();
        }

        internal static ProductCategory GetProductCategory(SafeDataReader dr)
        {
            var p = new ProductCategory();
            p.Fetch(dr);
            return p;
        }

        protected void Fetch(SafeDataReader sdr)
        {
            using (BypassPropertyChecks)
            {
                int i = 0;
                LoadProperty(ProductCategoryIDProperty, sdr.GetInt32(i++));
                LoadProperty(CategoryNameProperty, sdr.GetString(i++));
                object tmpIsActiveInd = sdr.GetValue(i++);
                if (tmpIsActiveInd == System.DBNull.Value)
                {
                    LoadProperty(IsActiveIndProperty, null);
                }
                else
                {
                    LoadProperty(IsActiveIndProperty, (bool?)tmpIsActiveInd);
                }
                LoadProperty(DeletedDateProperty, sdr.GetValue(i++));
                LoadProperty(DeletedByProperty, sdr.GetInt32(i++));
                LoadProperty(CreatedDateProperty, sdr.GetSmartDate(i++));
                LoadProperty(CreatedByProperty, sdr.GetInt32(i++));
                LoadProperty(ModifiedDateProperty, sdr.GetSmartDate(i++));
                LoadProperty(ModifiedByProperty, sdr.GetInt32(i++));
            }

            MarkAsChild();
            MarkOld();
            BusinessRules.CheckRules();
        }

        protected override Action<SqlCommand> SetupSaveCommand(SqlCommand cm)
        {
            LoadProperty(ModifiedByProperty, Settings.CurrentUser.UserID);

            AddPrimaryKeyParam(cm, ProductCategoryIDProperty);

            cm.Parameters.AddWithValue("@CategoryName", GetProperty(CategoryNameProperty));
            cm.Parameters.AddWithValue("@IsActiveInd", Singular.Misc.NothingDBNull(GetProperty(IsActiveIndProperty)));
            cm.Parameters.AddWithValue("@DeletedDate", Singular.Misc.NothingDBNull(DeletedDate));
            cm.Parameters.AddWithValue("@DeletedBy", GetProperty(DeletedByProperty));
            cm.Parameters.AddWithValue("@ModifiedBy", GetProperty(ModifiedByProperty));

            return (scm) =>
            {
    // Post Save
    if (this.IsNew)
                {
                    LoadProperty(ProductCategoryIDProperty, scm.Parameters["@ProductCategoryID"].Value);
                }
            };
        }

        protected override void SaveChildren()
        {
            // No Children
        }

        protected override void SetupDeleteCommand(SqlCommand cm)
        {
            cm.Parameters.AddWithValue("@ProductCategoryID", GetProperty(ProductCategoryIDProperty));
        }

        #endregion

    }

}