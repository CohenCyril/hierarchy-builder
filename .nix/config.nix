{
  format = "1.0.0";
  attribute = "hierarchy-builder";
  no-rocq-yet = true;
  default-bundle = "coq-universes-clauses";
  bundles = let
    mcHBcommon = {
      mathcomp.override.version = "master";
      mathcomp-bigenough.override.version = "master";
      mathcomp-finmap.override.version = "master";
      mathcomp-real-closed.override.version = "master";
      mathcomp-analysis.override.version = "master";
    };
    coqMcHBcommon = {
      mathcomp.override.version = "master";
      mathcomp.job = true;
      mathcomp-single.job = true;
      graph-theory.job = false;
      fourcolor.override.version = "master";
      odd-order.override.version = "master";
      mathcomp-finmap.override.version = "master";
      mathcomp-classical.override.version = "master";
      mathcomp-analysis.override.version = "master";
      reglang.override.version = "master";
      coq-bits.override.version = "master";
      deriving.override.version = "master";
      mathcomp-bigenough.override.version = "master";
      multinomials.override.version = "master";
      mathcomp-real-closed.override.version = "master";
      coqeal.override.version = "master";
      mathcomp-zify.override.version = "master";
      mathcomp-algebra-tactics.override.version = "master";
      mathcomp-word.override.version = "master";
      coquelicot.override.version = "master";
      ExtLib.override.version = "master";
      simple-io.override.version = "master";
      QuickChick.override.version = "master";
      # jasmin.override.version = "main";
      jasmin.job = false;  # currently broken
      autosubst.job = false;
      ConCert.job = false;
      interval.job = false;
    };
  in {
    "universes-and-variances" = { rocqPackages = {
      rocq-core.override.version = "mattam82:universes-and-variances";
      stdlib.override.version = "mattam82:universes-and-variances";
      rocq-elpi.override.version = "mattam82:universes-and-variances";
      bignums.override.version = "mattam82:universes-and-variances";
    }; coqPackages = mcHBcommon // {
      coq.override.version = "mattam82:universes-and-variances";
      stdlib.override.version = "mattam82:universes-and-variances";
      coq-elpi.override.version = "mattam82:universes-and-variances";
      bignums.override.version = "mattam82:universes-and-variances";
      coquelicot.job = false;
    }; };

    "rocq-universes-and-variances" = {
      rocqPackages = {
        rocq-core.override.version = "mattam82:universes-and-variances";
        stdlib.override.version = "mattam82:universes-and-variances";
        rocq-elpi.override.version = "mattam82:universes-and-variances";
        rocq-elpi.override.elpi-version = "2.0.7";
        bignums.override.version = "master";
      };
      coqPackages = mcHBcommon // {
        coq.override.version = "mattam82:universes-and-variances";
        stdlib.override.version = "mattam82:universes-and-variances";
        coq-elpi.override.version = "mattam82:universes-and-variances";
        coq-elpi.override.elpi-version = "2.0.7";
        bignums.override.version = "master";
        coquelicot.job = false;
      };
    };

    "rocq-9.2" = { rocqPackages = mcHBcommon // {
      rocq-core.override.version = "9.2";
      micromega-plugin.override.version = "master";
      micromega-plugin.job = false;
    }; coqPackages = coqMcHBcommon // {
      coq.override.version = "9.2";
    }; };

    "rocq-9.1" = { rocqPackages = mcHBcommon // {
      rocq-core.override.version = "9.1";
    }; coqPackages = coqMcHBcommon // {
      coq.override.version = "9.1";
    }; };

    "rocq-9.0" = { rocqPackages = mcHBcommon // {
      rocq-core.override.version = "9.0";
    }; coqPackages = coqMcHBcommon // {
      coq.override.version = "9.0";
    }; };
  };
  cachix.coq = { };
  cachix.coq-community = { };
  cachix.math-comp.authToken = "CACHIX_AUTH_TOKEN";

}
