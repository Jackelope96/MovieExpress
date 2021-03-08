﻿// Generated 05 Jan 2021 09:47 - Singular Systems Object Generator Version 2.2.694
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


namespace MELib.Movies
{
  [Serializable]
  public class MovieList
   : MEBusinessListBase<MovieList, Movie>
  {
    #region " Business Methods "

    public Movie GetItem(int MovieID)
    {
      foreach (Movie child in this)
      {
        if (child.MovieID == MovieID)
        {
          return child;
        }
      }
      return null;
    }

    public override string ToString()
    {
      return "Movies";
    }

    #endregion

    #region " Data Access "

    [Serializable]
    public class Criteria
      : CriteriaBase<Criteria>
    {
      public int? MovieGenreID = null;
      public string MovieTitle = null;
      public Criteria()
      {
      }

      public Criteria(int? MovieGenreID)
      {
        this.MovieGenreID = MovieGenreID;
        this.MovieTitle = MovieTitle;
      }

    }

    public static MovieList NewMovieList()
    {
      return new MovieList();
    }

    public MovieList()
    {
      // must have parameter-less constructor
    }

    public static MovieList GetMovieList()
    {
      return DataPortal.Fetch<MovieList>(new Criteria());
    }

    public static MovieList GetMovieList(int? MovieGenreID, string MovieTitle)
    {
      return DataPortal.Fetch<MovieList>(new Criteria { MovieGenreID = MovieGenreID, MovieTitle = MovieTitle });
    }

    protected void Fetch(SafeDataReader sdr)
    {
      this.RaiseListChangedEvents = false;
      while (sdr.Read())
      {
        this.Add(Movie.GetMovie(sdr));
      }
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
            cm.CommandText = "GetProcs.getMovieList";

            cm.Parameters.AddWithValue("@MovieGenreID", Singular.Misc.ZeroDBNull(crit.MovieGenreID));
            cm.Parameters.AddWithValue("@MovieTitle", Singular.Misc.NothingDBNull(crit.MovieTitle));

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