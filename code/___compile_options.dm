//* Core settings
//! Fastboot flags - useful for debugging
/// Disable automatic roundstart icon smoothing.
// #define FASTBOOT_DISABLE_SMOOTHING (1<<0)
/// Disable loading late maps.
// #define FASTBOOT_DISABLE_LATELOAD (1<<1)
/// Disable atmospherics zone build.
// #define FASTBOOT_DISABLE_ZONES (1<<2)

/**
 * By using the testing("message") proc you can create debug-feedback for people with this uncommented,
 * but not visible in the release version
 */
// #define TESTING

/// Enables the ability to cache datum vars and retrieve later for debugging which vars changed.
// #define DATUMVAR_DEBUGGING_MODE

/// Comment this out if you are debugging problems that might be obscured by custom error handling in world/Error
#ifdef DEBUG
#define USE_CUSTOM_ERROR_HANDLER
#define DEBUG_SHUTTLES
#endif


#ifdef TESTING
#define DATUMVAR_DEBUGGING_MODE

/// Used to find the sources of harddels, quite laggy, don't be surpised if it freezes your client for a good while
// #define REFERENCE_TRACKING
#ifdef REFERENCE_TRACKING

/// Used for doing dry runs of the reference finder, to test for feature completeness
/// Slightly slower, higher in memory. Just not optimal
// #define REFERENCE_TRACKING_DEBUG

/// Run a lookup on things hard deleting by default.
// #define GC_FAILURE_HARD_LOOKUP
#ifdef GC_FAILURE_HARD_LOOKUP
/// Don't stop when searching, go till you're totally done
#define FIND_REF_NO_CHECK_TICK
#endif //ifdef GC_FAILURE_HARD_LOOKUP

#endif //ifdef REFERENCE_TRACKING

/**
 * Enables debug messages for every single reaction step.
 * This is 1 message per 0.5s for a SINGLE reaction.
 * Useful for tracking down bugs/asking me for help in the main reaction handiler (equilibrium.dm).
 *
 * * Requires TESTING to be defined to work.
 * ! Not implemented yet.
 */
// #define REAGENTS_TESTING

/**
 * Displays static object lighting updates.
 *
 * Also enables some debug vars on sslighting that can be used to modify
 * how extensively we prune lighting corners to update.
 */
#define VISUALIZE_LIGHT_UPDATES

/// Highlights atmos active turfs in green.
#define VISUALIZE_ACTIVE_TURFS
#endif //ifdef TESTING

/// If this is uncommented, we do a single run though of the game setup and tear down process with unit tests in between
// #define UNIT_TESTS

/**
 * If this is uncommented, will attempt to load and initialize prof.dll/libprof.so.
 * We do not ship byond-tracy. Build it yourself here: https://github.com/mafemergency/byond-tracy/
 */
// #define USE_BYOND_TRACY

/// If defined, we will NOT defer asset generation till later in the game, and will instead do it all at once, during initiialize.
//#define DO_NOT_DEFER_ASSETS

/// If this is uncommented, Autowiki will generate edits and shut down the server.
/// Prefer the autowiki build target instead.
// #define AUTOWIKI

/// If this is uncommented, will profile mapload atom initializations
// #define PROFILE_MAPLOAD_INIT_ATOM

/// If this is uncommented, force our verb processing into just the 2% of a tick
/// We normally reserve for it
/// NEVER run this on live, it's for simulating highpop only
// #define VERB_STRESS_TEST

#ifdef VERB_STRESS_TEST
/// Uncomment this to force all verbs to run into overtime all of the time
/// Essentially negating the reserve 2%

// #define FORCE_VERB_OVERTIME
#warn Hey brother, you're running in LAG MODE.
#warn IF YOU PUT THIS ON LIVE I WILL FIND YOU AND MAKE YOU WISH YOU WERE NEVE-
#endif

#ifndef PRELOAD_RSC				//set to:
///	0 to allow using external resources or on-demand behaviour;
#define PRELOAD_RSC	2
#endif							//	1 to use the default behaviour;
								//	2 for preloading absolutely everything;

#ifdef LOWMEMORYMODE
#define FORCE_MAP "_maps/runtimestation.json"
#endif

//Update this whenever you need to take advantage of more recent byond features
#define MIN_COMPILER_VERSION 513
#define MIN_COMPILER_BUILD 1514
#if DM_VERSION < MIN_COMPILER_VERSION || DM_BUILD < MIN_COMPILER_BUILD
//Don't forget to update this part
#error Your version of BYOND is too out-of-date to compile this project. Go to https://secure.byond.com/download and update.
#error You need version 513.1514 or higher
#endif

//Additional code for the above flags.
#ifdef TESTING
#warn compiling in TESTING mode. testing() debug messages will be visible.
#endif

#ifdef CIBUILDING
#define UNIT_TESTS
#endif

#ifdef CITESTING
#define TESTING
#endif

#if !defined(CBT) && !defined(SPACEMAN_DMM)
#warn Building with Dream Maker is no longer supported and will result in errors.
#warn In order to build, run BUILD.bat in the root directory.
#warn Consider switching to VSCode editor instead, where you can press Ctrl+Shift+B to build.
#endif

//* Modules follow

//! Atmospherics

//? Gasmixtures
/// enable general assertions
#define GASMIXTURE_ASSERTIONS

//? ZAS (Environmental)
/// Uncomment to turn on Multi-Z ZAS Support!
#define MULTIZAS
/// uncomment to enable laggy as sin ZAS debugging systems coded in for when doing bugfixes or major systems overhaulling.
// #define ZAS_ASSERTIONS
/// uncomment to enable *actually* laggy as sin ZAS debugging, like "list in contents". don't do this without a major reason.
// #define ZAS_ASSERTIONS_EXPENSIVE
/// uncomment to enable debugging graphics. you probably want to keep this off in live!
// #define ZAS_DEBUG_GRAPHICS
/// uncomment to enable some otherwise useless hook points for zas debugging
// #define ZAS_BREAKPOINT_HOOKS

#ifdef ZAS_DEBUG_GRAPHICS
	#define ZAS_BREAKPOINT_HOOKS
#endif

//! Overlays

// A reasonable number of maximum overlays an object needs
// If you think you need more, rethink it
#define MAX_ATOM_OVERLAYS 100

//! Timers

// #define TIMER_LOOP_DEBUGGING
